import requests
from flask import Blueprint, render_template, redirect
from flask_wtf import FlaskForm
from wtforms import IntegerField, TextAreaField, StringField, validators, DateTimeField
from wtforms_components import read_only

from api_interface.model import TransactionEntity

trent_pages = Blueprint('trent_pages', __name__, template_folder='templates')


class TransactionEntityForm(FlaskForm):
    id = IntegerField("ID")
    description = TextAreaField('Description', validators=[validators.Optional()])
    organisation = IntegerField('Organisation', validators=[validators.Optional()])
    person = IntegerField('Person', validators=[validators.Optional()])
    iban = StringField('iban', validators=[validators.Optional()])
    bic = StringField('bic', validators=[validators.Optional()])
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(TransactionEntityForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.added)
        read_only(self.changed)


@trent_pages.route("/api/trents", methods=['GET', 'POST'])
def trents():
    form = TransactionEntityForm()
    if form.validate_on_submit():
        new_trent = {
            'description': form.description.data,
            'organisation': form.organisation.data,
            'person': form.person.data,
            'iban': form.iban.data,
            'bic': form.bic.data,
        }
        r = requests.post("http://localhost:8000/api/transaction_entities", json=new_trent)
        if r.ok:
            return redirect('/api/trents')
        else:
            print("?!XD")

    trent_list = requests.get("http://localhost:8000/api/transaction_entities").json()
    return render_template('models/trents.html', trents=trent_list, form=form)


@trent_pages.route("/api/trents/<int:trent_id>", methods=['GET', 'POST'])
def single_trent(trent_id: int):
    trent = requests.get("http://localhost:8000/api/transaction_entities/" + str(trent_id)).json()
    trent = TransactionEntity(data=trent)
    form = TransactionEntityForm(obj=trent)

    form.id.data = trent.id
    form.added.data = trent.added
    if trent.changed is not None:
        form.changed.data = trent.changed

    if form.validate_on_submit():
        update_trent = {
            'description': form.description.data,
            'organisation': form.organisation.data,
            'person': form.person.data,
            'iban': form.iban.data,
            'bic': form.bic.data
        }
        print(update_trent)
        r = requests.patch("http://localhost:8000/api/transaction_entities/" + str(trent_id), json=update_trent)
        print(r)

    return render_template("models/trent.html", trent=trent, form=form)


@trent_pages.route("/intern/api/trents/delete/<int:trent_id>", methods=['GET', 'POST'])
def delete_trent(trent_id: int):
    requests.delete("http://localhost:8000/api/transaction_entities/" + str(trent_id))
    return redirect('/api/trents')

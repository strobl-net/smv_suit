import requests
from flask import render_template, redirect, Blueprint, request
from flask_wtf import FlaskForm
from wtforms import IntegerField, BooleanField, DateTimeField, TextAreaField, validators, SelectField, StringField
from wtforms_components import read_only

from api_interface.model import UpdateTransaction, UpdateDepodraw

depodraw_pages = Blueprint('depodraw_pages', __name__, template_folder='templates')


class NewDepodrawForm(FlaskForm):
    description = TextAreaField('Description', validators=[validators.Optional()])
    from_bank = BooleanField('From Bank')
    change = IntegerField('Change', validators=[validators.DataRequired()])
    currency = SelectField('Currency', choices=['EUR', 'USD'], validators=[validators.DataRequired()])


class UpdateDepodrawForm(FlaskForm):
    id = IntegerField("ID")
    description = TextAreaField('Description', validators=[validators.Optional()])
    transaction_up_name = StringField("Sender Name / ID")
    transaction_down_name = StringField("Receiver Name / ID")
    change = IntegerField("Change", validators=[validators.DataRequired()])
    currency = SelectField('Currency', choices=['EUR', 'USD'], validators=[validators.DataRequired()])
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(UpdateDepodrawForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.transaction_up_name)
        read_only(self.transaction_down_name)
        read_only(self.added)
        read_only(self.changed)


@depodraw_pages.route("/api/depodraws", methods=['GET', 'POST'])
def depodraws():
    form = NewDepodrawForm()
    if form.validate_on_submit():
        new_depodraw = {
            'account_up': form.from_bank.data,
            'description': form.description.data,
            'change': form.change.data,
            'currency': form.currency.data
        }
        print(new_depodraw)
        r = requests.post("http://localhost:8000/api/depodraws", json=new_depodraw)
        print(r.request.body)
        if r.ok:
            return redirect('/api/depodraws')
        else:
            print("?!XD")

    depodraw_list = requests.get("http://localhost:8000/api/depodraws").json()

    return render_template('models/depodraws.html', depodraws=depodraw_list, form=form)


@depodraw_pages.route("/api/depodraws/<int:depodraw_id>", methods=['GET', 'POST'])
def single_depodraw(depodraw_id: int):
    depodraw = requests.get("http://localhost:8000/api/e/depodraws/" + str(depodraw_id)).json()
    print(depodraw)
    depodraw = UpdateDepodraw(data=depodraw)
    print(depodraw)
    form = UpdateDepodrawForm(obj=depodraw)

    form.id.data = depodraw.id
    form.added.data = depodraw.added
    if depodraw.changed is not None:
        form.changed.data = depodraw.changed

    if form.validate_on_submit():
        update_depodraw = {
            'description': form.description.data,
        }
        print(update_depodraw)
        r = requests.patch("http://localhost:8000/api/depodraws/" + str(depodraw_id), json=update_depodraw)
        if r.ok:
            return redirect('/api/depodraws')
        else:
            print('?XD')

    return render_template("models/depodraw.html", depodraw=depodraw, form=form)


@depodraw_pages.route("/intern/api/depodraws/delete/<int:depodraw_id>", methods=['GET', 'POST'])
def delete_depodraw(depodraw_id: int):
    requests.delete("http://localhost:8000/api/depodraws/" + str(depodraw_id))
    return redirect('/api/depodraws')

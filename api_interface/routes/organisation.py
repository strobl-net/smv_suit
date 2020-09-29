import requests
from flask import Blueprint, render_template, redirect
from flask_wtf import FlaskForm
from wtforms import IntegerField, TextAreaField, StringField, validators, DateTimeField
from wtforms_components import read_only

from api_interface.model import Organisation
from api_interface.routes.transaction_entity import TransactionEntityForm

organisation_pages = Blueprint('organisation_pages', __name__, template_folder='templates')


class OrganisationForm(FlaskForm):
    id = IntegerField("ID")
    name = StringField('Name', validators=[validators.DataRequired(message="Please enter a name")])
    description = TextAreaField('Description', validators=[validators.Optional()])
    site = StringField('Site', validators=[validators.Optional(), validators.URL("Invalid Address")])
    location = StringField('Site', validators=[validators.Optional()])
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(OrganisationForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.added)
        read_only(self.changed)


@organisation_pages.route("/api/organisations", methods=['GET', 'POST'])
def organisations():
    form = OrganisationForm()
    if form.validate_on_submit():
        new_organisation = {
            'name': form.name.data,
            'description': form.description.data,
            'site': form.site.data,
            'location': form.location.data
        }
        r = requests.post("http://localhost:8000/api/organisations", json=new_organisation)
        if r.ok:
            return redirect('/api/organisations')
        else:
            print("?!XD")

    organisation_list = requests.get("http://localhost:8000/api/organisations").json()
    return render_template('models/organisations.html', organisations=organisation_list, form=form)


@organisation_pages.route("/api/organisation/<int:organisation_id>", methods=['GET', 'POST'])
def single_organisation(organisation_id: int):
    organisation = requests.get("http://localhost:8000/api/organisations/" + str(organisation_id)).json()

    organisation = Organisation(data=organisation)

    form = OrganisationForm(obj=organisation)
    trent_form = TransactionEntityForm()

    form.id.data = organisation.id
    form.added.data = organisation.added
    if organisation.changed is not None:
        form.changed.data = organisation.changed

    if form.validate_on_submit():
        update_organisation = {
            'name': form.name.data,
            'description': form.description.data,
            'site': form.site.data,
            'location': form.location.data
        }
        requests.patch("http://localhost:8000/api/organisations/" + str(organisation_id), json=update_organisation)

    if trent_form.validate_on_submit():
        redirect('/api/organisations/' + str(organisation_id))

    return render_template("models/organisation.html", organisation=organisation, form=form, form2=trent_form)


@organisation_pages.route("/intern/api/organisations/delete/<int:organisation_id>", methods=['GET', 'POST'])
def delete_organisation(organisation_id: int):
    requests.delete("http://localhost:8000/api/organisations/" + str(organisation_id))
    return redirect('/api/organisations')

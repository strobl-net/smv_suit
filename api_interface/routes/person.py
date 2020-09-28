import requests
from flask import render_template, redirect, Blueprint
from flask_wtf import FlaskForm
from wtforms import IntegerField, StringField, DateTimeField, validators
from wtforms_components import EmailField, read_only

from api_interface.model import Person
from api_interface.routes.transaction_entity import TransactionEntityForm

person_pages = Blueprint('person_pages', __name__, template_folder='templates')


class PersonForm(FlaskForm):
    id = IntegerField("ID")
    name = StringField('Name', validators=[validators.DataRequired(message='Please enter a name')])
    email = EmailField('Email', validators=[validators.Optional(), validators.Email('invalid email address')])
    phone = StringField('Phone', validators=[validators.Optional()])
    tags = StringField('Tags', validators=[validators.Optional()])
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(PersonForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.added)
        read_only(self.changed)


@person_pages.route("/api/persons", methods=['GET', 'POST'])
def persons():
    form = PersonForm()
    if form.validate_on_submit():
        tags = form.tags.data
        tags = tags.replace(' ', '')
        tags = tags.split(',')
        new_person = {
            'name': form.name.data,
            'email': form.email.data,
            'phone': form.phone.data,
            'tags': tags
        }
        r = requests.post("http://localhost:8000/api/persons", json=new_person)
        if r.ok:
            return redirect('/api/persons')
        else:
            print("?!XD")

    person_list = requests.get("http://localhost:8000/api/persons").json()
    return render_template('models/persons.html', persons=person_list, form=form)


@person_pages.route("/api/persons/<int:person_id>", methods=['GET', 'POST'])
def single_person(person_id: int):
    person = requests.get("http://localhost:8000/api/persons/" + str(person_id)).json()

    person = Person(data=person)

    form = PersonForm(obj=person)
    trent_form = TransactionEntityForm()

    form.id.data = person.id
    form.added.data = person.added
    if person.changed is not None:
        form.changed.data = person.changed

    if form.validate_on_submit():
        tags = form.tags.data
        tags = tags.replace(' ', '')
        tags = tags.split(',')
        update_person = {
            'name': form.name.data,
            'email': form.email.data,
            'phone': form.phone.data,
            'tags': tags
        }
        requests.patch("http://localhost:8000/api/persons/" + str(person_id), json=update_person)

    if trent_form.validate_on_submit():
        redirect('/api/persons/' + str(person_id))

    return render_template("models/person.html", person=person, form=form, form2=trent_form)


@person_pages.route("/intern/api/persons/delete/<int:person_id>", methods=['GET', 'POST'])
def delete_person(person_id: int):
    requests.delete("http://localhost:8000/api/persons/" + str(person_id))
    return redirect('/api/persons')

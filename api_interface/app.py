from datetime import datetime

from flask import Flask, render_template, redirect
from flask_wtf import FlaskForm
from wtforms import StringField, TextAreaField, validators, DateTimeField, IntegerField
from wtforms_components import read_only
import requests
from wtforms.fields.html5 import EmailField
from flask_bootstrap import Bootstrap
from model import Person

debug = True
app = Flask(__name__)
app.jinja_env.cache = {}
app.config['SECRET_KEY'] = 'VERY SECURE KEY XD'
bootstrap = Bootstrap(app)


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


class OrganisationForm(FlaskForm):
    name = StringField('Name', validators=[validators.DataRequired(message="Please enter a name")])
    description = TextAreaField('Description', validators=[validators.Optional()])
    site = StringField('Site', validators=[validators.Optional(), validators.URL("Invalid Address")])
    location = StringField('Site', validators=[validators.Optional()])


class TransactionEntityForm(FlaskForm):
    description = TextAreaField('Description', validators=[validators.Optional()])
    organisation = TextAreaField('Organisation', validators=[validators.Optional()])
    person = TextAreaField('Person', validators=[validators.Optional()])
    iban = TextAreaField('iban', validators=[validators.Optional()])
    bic = TextAreaField('nic', validators=[validators.Optional()])


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/api")
def api():
    return render_template('api.html')


@app.route("/api/persons", methods=['GET', 'POST'])
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


@app.route("/intern/api/persons/delete/<int:person_id>", methods=['POST'])
def delete_person(person_id: int):
    requests.delete("http://localhost:8000/api/persons/" + str(person_id))
    return redirect('/api/persons')


@app.route("/api/persons/<int:person_id>", methods=['GET', 'POST'])
def single_person(person_id: int):
    person = requests.get("http://localhost:8000/api/persons/" + str(person_id)).json()

    person = Person(data=person)
    form = PersonForm(obj=person)

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
        print(update_person)
        requests.patch("http://localhost:8000/api/persons/" + str(person_id), json=update_person)

    return render_template("models/person.html", person=person, form=form)


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=debug, port=8001)

from typing import List

from flask import Flask, render_template, redirect
from flask_wtf import FlaskForm
from wtforms import StringField, validators
import requests
from wtforms.fields.html5 import EmailField
from flask_bootstrap import Bootstrap

debug = False
app = Flask(__name__)
app.jinja_env.cache = {}
app.config['SECRET_KEY'] = 'VERY SECURE KEY XD'
bootstrap = Bootstrap(app)


class PersonForm(FlaskForm):
    name = StringField('Name', validators=[validators.DataRequired(message='Please enter a name')])
    email = EmailField('Email', validators=[validators.Optional(), validators.Email('invalid email address')])
    phone = StringField('Phone', validators=[validators.Optional()])
    tags = StringField('Tags', validators=[validators.Optional()])


@app.route("/")
def index():
    return render_template('index.html')


@app.route("/api")
def api():
    return render_template('api.html')


@app.route("/api/persons", methods=['GET', 'POST'])
def persons():
    form = PersonForm()
    print(test(2))
    if form.validate_on_submit():
        tags = form.tags.data
        tags.replace(' ', '')
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

    title = "Person"
    person_list = requests.get("http://localhost:8000/api/persons").json()
    return render_template('models/person.html', persons=person_list, title=title, form=form)


def test(x: int) -> List[str]:
    y: str = "test"
    return [str(x), str(x), y]


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=debug, port=8001)

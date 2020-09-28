from flask_wtf import FlaskForm
from wtforms import IntegerField, TextAreaField, StringField, validators, DateTimeField
from wtforms_components import read_only


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

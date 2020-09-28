from flask_wtf import FlaskForm
from wtforms import IntegerField, TextAreaField, StringField, validators, DateTimeField
from wtforms_components import read_only


class TransactionEntityForm(FlaskForm):
    id = IntegerField("ID")
    description = TextAreaField('Description', validators=[validators.Optional()])
    organisation = StringField('Organisation', validators=[validators.Optional()])
    person = StringField('Person', validators=[validators.Optional()])
    iban = StringField('iban', validators=[validators.Optional()])
    bic = StringField('bic', validators=[validators.Optional()])
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(TransactionEntityForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.added)
        read_only(self.changed)
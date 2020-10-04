import requests
from flask import render_template, redirect, Blueprint, request
from flask_wtf import FlaskForm
from wtforms import IntegerField, StringField, DateTimeField, validators
from wtforms_components import EmailField, read_only

from api_interface.model import Person
from api_interface.routes.transaction_entity import TransactionEntityForm

other_pages = Blueprint('other_pages', __name__, template_folder='templates')


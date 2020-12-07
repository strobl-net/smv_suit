import requests
from flask import render_template, redirect, Blueprint
from flask_wtf import FlaskForm
from wtforms import IntegerField, BooleanField, DateTimeField, TextAreaField, validators, SelectField, StringField
from wtforms_components import read_only
import json

from api_interface.model import UpdateBill

bill_pages = Blueprint('bill_pages', __name__, template_folder='templates')


class BillForm(FlaskForm):
    id = IntegerField("ID")
    description = TextAreaField('Description', validators=[validators.Optional()])
    sender = IntegerField('Sender')
    sender_local = BooleanField('Is Local Sender')
    receiver = IntegerField('Receiver')
    receiver_local = BooleanField('Is Local Receiver')
    money_node = IntegerField('Money Node')
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(BillForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.added)
        read_only(self.changed)


class NewBillForm(FlaskForm):
    received = DateTimeField('Received', format="%Y-%m-%dT%H:%M:%S.%f", validators=[validators.DataRequired()])
    processed = DateTimeField('Processed', format="%Y-%m-%dT%H:%M:%S.%f", validators=[validators.Optional()])
    products = StringField("Products", validators=[validators.Optional()])
    responsible = IntegerField("Responsible", validators=[validators.Optional()])
    transaction_description = TextAreaField('Description', validators=[validators.Optional()])
    transaction_sender = IntegerField('Sender', validators=[validators.DataRequired()])
    transaction_sender_local = BooleanField('Is Local Sender', validators=[validators.Optional()])
    transaction_receiver = IntegerField('Receiver', validators=[validators.DataRequired()])
    transaction_receiver_local = BooleanField('Is Local Receiver', validators=[validators.Optional()])
    money_branch = SelectField('Branch', choices=['Digital', 'Cash'], validators=[validators.DataRequired()])
    money_change = IntegerField('Change', validators=[validators.DataRequired()])
    money_currency = SelectField('Currency', choices=['EUR', 'USD'], validators=[validators.DataRequired()])
    money_processed = BooleanField('Processed', validators=[validators.DataRequired()])


class UpdateBillForm(FlaskForm):
    id = IntegerField("ID")
    received = DateTimeField('Received', format="%Y-%m-%dT%H:%M:%S.%f", validators=[validators.DataRequired()])
    processed = DateTimeField('Processed', format="%Y-%m-%dT%H:%M:%S.%f", validators=[validators.Optional()])
    products = StringField("Products", validators=[validators.Optional()])
    responsible_id = IntegerField("Responsible", validators=[validators.Optional()])
    transaction_id = IntegerField("Transaction")
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")
    transaction_description = TextAreaField('Description', validators=[validators.Optional()])
    transaction_sender = IntegerField('Sender', validators=[validators.DataRequired()])
    transaction_sender_local = BooleanField('Is Local Sender')
    transaction_receiver = IntegerField('Receiver', validators=[validators.DataRequired()])
    transaction_receiver_local = BooleanField('Is Local Receiver')
    transaction_added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    transaction_changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")
    money_node_id = IntegerField('Money Node', default=0)
    money_branch = SelectField('Branch', choices=['Digital', 'Cash'], validators=[validators.DataRequired()])
    money_change = IntegerField('Change', validators=[validators.DataRequired()])
    money_currency = SelectField('Currency', choices=['EUR', 'USD'], validators=[validators.DataRequired()])
    money_processed = BooleanField('Processed')
    money_added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    money_changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(UpdateBillForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.added)
        read_only(self.changed)
        read_only(self.transaction_id)
        read_only(self.transaction_added)
        read_only(self.transaction_changed)
        read_only(self.money_node_id)
        read_only(self.money_added)
        read_only(self.money_changed)


@bill_pages.route("/api/bills", methods=['GET', 'POST'])
def bills():
    form = NewBillForm()
    if form.validate_on_submit():
        products = form.products.data
        products = products.replace(' ', '')
        products = products.split(',')
        products = [int(product) for product in products]
        new_bill = {
            'received': date_to_iso8601(form.received),
            'processed_datetime': date_to_iso8601(form.processed),
            'products': products,
            'responsible': form.responsible.data,
            'description': form.transaction_description.data,
            'sender': form.transaction_sender.data,
            'sender_local': form.transaction_sender_local.data,
            'receiver': form.transaction_receiver.data,
            'receiver_local': form.transaction_receiver_local.data,
            'branch': form.money_branch.data,
            'change': form.money_change.data,
            'currency': form.money_currency.data,
            'processed': form.money_processed.data
        }
        print(new_bill)
        r = requests.post("http://localhost:8000/api/bills", json=new_bill)
        if r.ok:
            return redirect('/api/bills')
        else:
            print("?!XD")

    bill_list = requests.get("http://localhost:8000/api/bills").json()
    return render_template('models/bills.html', bills=bill_list, form=form)


@bill_pages.route("/api/bills/<int:bill_id>", methods=['GET', 'POST'])
def single_bill(bill_id: int):
    bill = requests.get("http://localhost:8000/api/e/bills/" + str(bill_id)).json()
    bill = UpdateBill(data=bill)
    form = UpdateBillForm(obj=bill)

    form.id.data = bill.id
    form.added.data = bill.added
    form.money_added.data = bill.money_added
    if bill.changed is not None:
        form.changed.data = bill.changed

    if form.validate_on_submit():
        products = form.products.data
        products = products.replace('[', '')
        products = products.replace(']', '')
        products = products.replace(' ', '')
        products = products.split(',')
        products = [int(product) for product in products]
        update_bill = {
            'received': date_to_iso8601(form.received),
            'processed': date_to_iso8601(form.processed),
            'products': products,
            'responsible': form.responsible_id.data,
            'transaction_description': form.transaction_description.data,
            'transaction_sender': form.transaction_sender.data,
            'transaction_sender_local': form.transaction_sender_local.data,
            'transaction_receiver': form.transaction_receiver.data,
            'transaction_receiver_local': form.transaction_receiver_local.data,
            'money_branch': form.money_branch.data,
            'money_change': form.money_change.data,
            'money_currency': form.money_currency.data,
            'money_processed': form.money_processed.data
        }
        r = requests.patch("http://localhost:8000/api/bills/" + str(bill_id), json=update_bill)
        if r.ok:
            return redirect('/api/bills')
        else:
            print('?XD')

    return render_template("models/bill.html", bill=bill, form=form)


@bill_pages.route("/intern/api/bills/delete/<int:bill_id>", methods=['GET', 'POST'])
def delete_bill(bill_id: int):
    requests.delete("http://localhost:8000/api/bills/" + str(bill_id))
    return redirect('/api/bills')


def date_to_iso8601(date: DateTimeField) -> str:
    iso_date = str(date.data.date()) + "T" + str(date.data.time())
    return iso_date

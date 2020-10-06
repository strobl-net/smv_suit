import requests
from flask import render_template, redirect, Blueprint, request
from flask_wtf import FlaskForm
from wtforms import IntegerField, BooleanField, DateTimeField, TextAreaField, validators, SelectField, StringField
from wtforms_components import read_only

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
    received = DateTimeField('Received', validators=[validators.DataRequired()])
    processed = DateTimeField('Processed', validators=[validators.Optional()])
    products = StringField("Products", validators=[validators.Optional()])
    responsible = IntegerField("Responsible", validators=[validators.Optional()])
    transaction_description = TextAreaField('Description', validators=[validators.Optional()])
    transaction_sender = IntegerField('Sender', validators=[validators.DataRequired()])
    transaction_sender_local = BooleanField('Is Local Sender', validators=[validators.DataRequired()])
    transaction_receiver = IntegerField('Receiver', validators=[validators.DataRequired()])
    transaction_receiver_local = BooleanField('Is Local Receiver', validators=[validators.DataRequired()])
    money_branch = SelectField('Name', choices=['Digital', 'Cash'], validators=[validators.DataRequired()])
    money_change = IntegerField('Change', validators=[validators.DataRequired()])
    money_currency = SelectField('Currency', choices=['EUR', 'USD'], validators=[validators.DataRequired()])
    money_processed = BooleanField('Processed', validators=[validators.DataRequired()])


class UpdateBillForm(FlaskForm):
    id = IntegerField("ID")
    received = DateTimeField('Received', validators=[validators.DataRequired()])
    processed = DateTimeField('Processed', validators=[validators.Optional()])
    products = StringField("Products", validators=[validators.Optional()])
    responsible = IntegerField("Responsible", validators=[validators.Optional()])
    transaction_id = IntegerField("Transaction")
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")
    transaction_description = TextAreaField('Description', validators=[validators.Optional()])
    transaction_sender = IntegerField('Sender', validators=[validators.DataRequired()])
    transaction_sender_local = BooleanField('Is Local Sender')
    transaction_receiver = IntegerField('Receiver', validators=[validators.DataRequired()])
    transaction_receiver_local = BooleanField('Is Local Receiver')
    transaction_money_node_id = IntegerField('Money Node', default=0)
    transaction_added = DateTimeField('Added')
    transaction_changed = DateTimeField('Changed')
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
        read_only(self.transaction_money_node_id)
        read_only(self.transaction_added)
        read_only(self.transaction_changed)
        read_only(self.money_added)
        read_only(self.money_changed)


@bill_pages.route("/api/transactions", methods=['GET', 'POST'])
def transactions():
    form = NewBillForm()
    if form.validate_on_submit():
        products = form.products.data
        products = products.replace(' ', '')
        products = products.split(',')
        new_bill = {
            'received': form.received.data,
            'processed': form.processed.data,
            'products': products,
            'responsible': form.responsible.data,
            'transaction_description': form.description.data,
            'transaction_sender': form.sender.data,
            'transaction_sender_local': form.sender_local.data,
            'transaction_receiver': form.receiver.data,
            'transaction_receiver_local': form.receiver_local.data,
            'money_branch': form.branch.data,
            'money_change': form.change.data,
            'money_currency': form.currency.data,
            'money_processed': form.processed.data
        }
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
        products = products.replace(' ', '')
        products = products.split(',')
        update_bill = {
            'received': form.received.data,
            'processed': form.processed.data,
            'products': products,
            'responsible': form.responsible.data,
            'transaction_description': form.description.data,
            'transaction_sender': form.sender.data,
            'transaction_sender_local': form.sender_local.data,
            'transaction_receiver': form.receiver.data,
            'transaction_receiver_local': form.receiver_local.data,
            'money_branch': form.branch.data,
            'money_change': form.change.data,
            'money_currency': form.currency.data,
            'money_processed': form.processed.data
        }
        print(update_bill)
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

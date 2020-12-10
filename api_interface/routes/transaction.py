import requests
from flask import render_template, redirect, Blueprint, request
from flask_wtf import FlaskForm
from wtforms import IntegerField, BooleanField, DateTimeField, TextAreaField, validators, SelectField
from wtforms_components import read_only

from api_interface.model import UpdateTransaction

transaction_pages = Blueprint('transaction_pages', __name__, template_folder='templates')


class TransactionForm(FlaskForm):
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
        super(TransactionForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.added)
        read_only(self.changed)


class NewTransactionForm(FlaskForm):
    description = TextAreaField('Description', validators=[validators.Optional()])
    sender = IntegerField('Sender', validators=[validators.DataRequired()])
    sender_local = BooleanField('Is Local Sender', validators=[validators.Optional()])
    receiver = IntegerField('Receiver', validators=[validators.DataRequired()])
    receiver_local = BooleanField('Is Local Receiver', validators=[validators.Optional()])
    branch = SelectField('Name', choices=['Digital', 'Cash'], validators=[validators.DataRequired()])
    change = IntegerField('Change', validators=[validators.DataRequired()])
    currency = SelectField('Currency', choices=['EUR', 'USD'], validators=[validators.DataRequired()])
    processed = BooleanField('Processed', validators=[validators.Optional()])


class UpdateTransactionForm(FlaskForm):
    id = IntegerField("ID")
    description = TextAreaField('Description', validators=[validators.Optional()])
    sender = IntegerField('Sender', validators=[validators.DataRequired()])
    sender_local = BooleanField('Is Local Sender', validators=[validators.Optional()])
    receiver = IntegerField('Receiver', validators=[validators.DataRequired()])
    receiver_local = BooleanField('Is Local Receiver', validators=[validators.Optional()])
    money_node_id = IntegerField('Money Node', default=0)
    money_branch = SelectField('Branch', choices=['Digital', 'Cash'], validators=[validators.DataRequired()])
    money_change = IntegerField('Change', validators=[validators.DataRequired()])
    money_currency = SelectField('Currency', choices=['EUR', 'USD'], validators=[validators.DataRequired()])
    money_processed = BooleanField('Processed')
    money_added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    money_changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(UpdateTransactionForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.added)
        read_only(self.changed)

        read_only(self.money_node_id)
        read_only(self.money_added)
        read_only(self.money_changed)


@transaction_pages.route("/api/transactions", methods=['GET', 'POST'])
def transactions():
    form = NewTransactionForm()
    if form.validate_on_submit():
        new_transaction = {
            'description': form.description.data,
            'sender': form.sender.data,
            'sender_local': form.sender_local.data,
            'receiver': form.receiver.data,
            'receiver_local': form.receiver_local.data,
            'branch': form.branch.data,
            'change': form.change.data,
            'currency': form.currency.data,
            'processed': form.processed.data
        }
        r = requests.post("http://localhost:8000/api/transactions", json=new_transaction)
        if r.ok:
            return redirect('/api/transactions')
        else:
            print("?!XD")

    transaction_list = requests.get("http://localhost:8000/api/transactions").json()
    return render_template('models/transactions.html', transactions=transaction_list, form=form)


@transaction_pages.route("/api/transactions/<int:transaction_id>", methods=['GET', 'POST'])
def single_transaction(transaction_id: int):
    transaction = requests.get("http://localhost:8000/api/e/transactions/" + str(transaction_id)).json()
    transaction = UpdateTransaction(data=transaction)
    form = UpdateTransactionForm(obj=transaction)

    form.id.data = transaction.id
    form.added.data = transaction.added
    form.money_added.data = transaction.money_added
    if transaction.changed is not None:
        form.changed.data = transaction.changed

    if form.validate_on_submit():
        update_transaction = {
            'description': form.description.data,
            'sender': form.sender.data,
            'sender_local': form.sender_local.data,
            'receiver': form.receiver.data,
            'receiver_local': form.receiver_local.data,
            'money_branch': form.money_branch.data,
            'money_change': form.money_change.data,
            'money_currency': form.money_currency.data,
            'money_processed': form.money_processed.data
        }
        print(update_transaction)
        r = requests.patch("http://localhost:8000/api/transactions/" + str(transaction_id), json=update_transaction)
        if r.ok:
            return redirect('/api/transactions')
        else:
            print('?XD')

    return render_template("models/transaction.html", transaction=transaction, form=form)


@transaction_pages.route("/intern/api/transactions/delete/<int:transaction_id>", methods=['GET', 'POST'])
def delete_transaction(transaction_id: int):
    requests.delete("http://localhost:8000/api/transactions/" + str(transaction_id))
    return redirect('/api/transactions')

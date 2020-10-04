import requests
from flask import render_template, redirect, Blueprint, request
from flask_wtf import FlaskForm
from wtforms import IntegerField, BooleanField, DateTimeField, TextAreaField, validators, SelectField
from wtforms_components import read_only

from api_interface.model import Transaction, ExpandedTransaction, MoneyNode
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
    sender_local = BooleanField('Is Local Sender', validators=[validators.DataRequired()])
    receiver = IntegerField('Receiver', validators=[validators.DataRequired()])
    receiver_local = BooleanField('Is Local Receiver', validators=[validators.DataRequired()])
    branch = SelectField('Name', choices=['Digital', 'Cash'], validators=[validators.DataRequired()])
    change = IntegerField('Change', validators=[validators.DataRequired()])
    currency = SelectField('Currency', choices=['EUR', 'USD'], validators=[validators.DataRequired()])
    processed = BooleanField('Processed', validators=[validators.DataRequired()])


class MoneyForm(FlaskForm):
    id = IntegerField("ID")
    branch = SelectField('Branch', choices=['Digital', 'Cash'], validators=[validators.DataRequired()])
    change = IntegerField('Change', validators=[validators.DataRequired()])
    currency = SelectField('Currency', choices=['EUR', 'USD'], validators=[validators.DataRequired()])
    processed = BooleanField('Processed')
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(MoneyForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.added)
        read_only(self.changed)


@transaction_pages.route("/api/transactions", methods=['GET', 'POST'])
def transactions():
    form = NewTransactionForm()
    if form.validate_on_submit():
        new_transaction = {
            'description': form.description.data,
            'sender': form.sender.data,
            'sender_local': form.sender_local.data,
            'receiver': form.receiver.data,
            'receiver_local': form.receiver.data,
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
    transaction = requests.get("http://localhost:8000/api/transactions/" + str(transaction_id)).json()
    transaction_exp = requests.get("http://localhost:8000/api/e/transactions/" + str(transaction_id)).json()

    transaction = Transaction(data=transaction)
    transaction_exp = ExpandedTransaction(data=transaction_exp)
    money: MoneyNode = transaction_exp.money_node

    form1 = TransactionForm(obj=transaction)
    form2 = MoneyForm(obj=money)

    form1.id.data = transaction.id
    form1.added.data = transaction.added
    if transaction.changed is not None:
        form1.changed.data = transaction.changed

    form2.id.data = money.id
    if money.changed is not None:
        form2.changed.data = money.changed

    if form1.validate_on_submit() and form2.validate_on_submit():
        update_transaction = {
            'description': form1.description.data,
            'sender': form1.sender.data,
            'sender_local': form1.sender_local.data,
            'receiver': form1.receiver.data,
            'receiver_local': form1.receiver_local.data
        }
        update_money_node = {
            'branch': form2.branch.data,
            'change': form2.change.data,
            'currency': form2.currency.data,
            'processed': form2.processed.data,
        }
        print(update_money_node)
        requests.patch("http://localhost:8000/api/transactions/" + str(transaction_id), json=update_transaction)
        r = requests.patch("http://localhost:8000/api/d/money_nodes/" + str(transaction_id), json=update_money_node)
        if r.ok:
            return redirect('/api/transactions')
        else:
            print('?XD')

    return render_template("models/transaction.html", transaction=transaction,
                           form1=form1, form2=form2)


@transaction_pages.route("/intern/api/transactions/delete/<int:transaction_id>", methods=['GET', 'POST'])
def delete_transaction(transaction_id: int):
    requests.delete("http://localhost:8000/api/transactions/" + str(transaction_id))
    return redirect('/api/transactions')
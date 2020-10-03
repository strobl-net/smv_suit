import requests
from flask import render_template, Blueprint
from flask_wtf import FlaskForm
from wtforms import IntegerField, DateTimeField, SelectField, BooleanField
from wtforms_components import read_only
from api_interface.model import MoneyNode

money_node_pages = Blueprint('money_node_pages', __name__, template_folder='templates')


class MoneyNodeForm(FlaskForm):
    id = IntegerField("ID")
    branch = SelectField('Name', choices=['Digital', 'Cash'])
    change = IntegerField('Change')
    currency = SelectField('Currency', choices=['EUR', 'USD'])
    processed = BooleanField('Processed')
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(MoneyNodeForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.branch)
        read_only(self.change)
        read_only(self.currency)
        read_only(self.processed)
        read_only(self.added)
        read_only(self.changed)


@money_node_pages.route('/api/money_nodes', methods=['GET', 'POST'])
def money_nodes():
    money_node_list = requests.get("http://localhost:8000/api/money_nodes").json()
    return render_template('models/money_nodes.html', money_nodes=money_node_list)


@money_node_pages.route('/api/money_nodes/<int:money_node_id>', methods=['GET', 'POST'])
def single_money_node(money_node_id: int):
    money_node = requests.get("http://localhost:8000/api/money_nodes/" + str(money_node_id)).json()
    print(money_node)
    money_node = MoneyNode(data=money_node)
    form = MoneyNodeForm(obj=money_node)

    return render_template("models/money_node.html", money_node=money_node, form=form)

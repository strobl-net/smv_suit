from flask import Blueprint, render_template
import requests

finance_pages = Blueprint('finance_pages', __name__, template_folder='templates')


@finance_pages.route("/api/finance", methods=['GET', 'POST'])
def general():
    values = requests.get("http://localhost:8000/api/finance/money-defaults").json()
    print(values)
    return render_template('finance.html', values=values)

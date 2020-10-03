import requests
from flask import render_template, redirect, Blueprint, request
from flask_wtf import FlaskForm
from wtforms import IntegerField, StringField, DateTimeField, validators, SelectField
from wtforms_components import read_only

from api_interface.model import Product

product_pages = Blueprint('product_pages', __name__, template_folder='templates')


class ProductForm(FlaskForm):
    id = IntegerField("ID")
    name = StringField('Name', validators=[validators.DataRequired(message='Please enter a name')])
    description = StringField('Description', validators=[validators.Optional()])
    change = IntegerField('Price', validators=[validators.Optional()])
    currency = SelectField('Currency', choices=['EUR', 'USD'], validators=[validators.Optional()])
    provider = IntegerField('Provider', validators=[validators.Optional()])
    tags = StringField('Tags', validators=[validators.Optional()])
    added = DateTimeField('Added', format="%Y-%m-%dT%H:%M:%S.%f")
    changed = DateTimeField('Changed', format="%Y-%m-%dT%H:%M:%S.%f")

    def __init__(self, *args, **kwargs):
        super(ProductForm, self).__init__(*args, **kwargs)
        read_only(self.id)
        read_only(self.added)
        read_only(self.changed)


@product_pages.route("/api/products", methods=['GET', 'POST'])
def products():
    form = ProductForm()
    if form.validate_on_submit():
        tags = form.tags.data
        tags = tags.replace(' ', '')
        tags = tags.split(',')
        new_product = {
            'name': form.name.data,
            'description': form.description.data,
            'change': form.change.data,
            'currency': form.currency.data,
            'provider': form.provider.data,
            'tags': tags
        }
        print(new_product)
        r = requests.post("http://localhost:8000/api/products", json=new_product)
        if r.ok:
            return redirect('/api/products')
        else:
            print("?!XD")

    product_list = requests.get("http://localhost:8000/api/products").json()
    return render_template('models/products.html', products=product_list, form=form)


@product_pages.route("/api/products/<int:product_id>", methods=['GET', 'POST'])
def single_product(product_id: int):
    form_id = request.args.get('form_id', 1, type=int)
    product = requests.get("http://localhost:8000/api/products/" + str(product_id)).json()
    product = Product(data=product)
    form = ProductForm(obj=product)

    form.id.data = product.id
    form.added.data = product.added
    if product.changed is not None:
        form.changed.data = product.changed

    if form.validate_on_submit() and form_id == 0:
        tags = form.tags.data
        tags = tags.replace(' ', '')
        tags = tags.split(',')
        update_product = {
            'name': form.name.data,
            'description': form.description.data,
            'change': form.change.data,
            'currency': form.currency.data,
            'provider': form.provider.data,
            'tags': tags
        }
        r = requests.patch("http://localhost:8000/api/products/" + str(product_id), json=update_product)
        if r.ok:
            return redirect('/api/products')
        else:
            print('?XD')

    return render_template("models/product.html", product=product, form=form)


@product_pages.route("/intern/api/products/delete/<int:product_id>", methods=['GET', 'POST'])
def delete_product(product_id: int):
    requests.delete("http://localhost:8000/api/products/" + str(product_id))
    return redirect('/api/products')

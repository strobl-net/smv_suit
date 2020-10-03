use crate::models::product::ExpandedProduct;
use crate::models::Expandable;
use crate::{
    models::product::{NewProduct, Product, UpdateProduct},
    schema::{products, products::dsl::products as products_query},
};
use diesel::prelude::*;

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Product>> {
    products_query
        .order(products::id.asc())
        .load::<Product>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Product> {
    products_query.find(id).get_result::<Product>(conn)
}

pub fn all_expanded(conn: &PgConnection) -> Vec<ExpandedProduct> {
    let products = all(conn).unwrap();
    let mut expanded_products = Vec::new();
    for product in products {
        expanded_products.push(product.expand(&conn))
    }
    expanded_products
}

pub fn by_id_expanded(conn: &PgConnection, id: i32) -> ExpandedProduct {
    let product = by_id(conn, id).unwrap();
    product.expand(&conn)
}

pub fn by_trent_id(conn: &PgConnection, id: i32) -> QueryResult<Vec<Product>> {
    products_query
        .filter(products::provider.eq(id))
        .order(products::id.asc())
        .load::<Product>(conn)
}

pub fn new(conn: &PgConnection, product: NewProduct) -> QueryResult<Product> {
    diesel::insert_into(products::table)
        .values(product)
        .get_result::<Product>(conn)
}

pub fn update(conn: &PgConnection, product: UpdateProduct, id: i32) -> QueryResult<Product> {
    diesel::update(products_query.find(id))
        .set(product)
        .get_result::<Product>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<Product> {
    diesel::delete(products_query.find(id)).get_result::<Product>(conn)
}

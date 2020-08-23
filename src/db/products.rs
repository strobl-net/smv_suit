use diesel::prelude::*;
use crate::{
    models::product::{NewProduct, Product, UpdateProduct},
    schema::{products, products::dsl::products as products_query},
};

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Product>> {
    products_query.order(products::id.asc()).load::<Product>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Product> {
    products_query.find(id).get_result::<Product>(conn)
}

pub fn new(conn: &PgConnection, product: NewProduct) -> QueryResult<Product> {
    diesel::insert_into(products::table)
        .values(product)
        .get_result::<Product>(conn)
}

pub fn update(conn: &PgConnection, product: NewProduct, id: i32) -> QueryResult<Product> {
    diesel::update(products_query.find(id))
        .set(product)
        .get_result::<Product>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<Product> {
    diesel::delete(products_query.find(id)).get_result::<Product>(conn)
}

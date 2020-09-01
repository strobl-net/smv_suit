use crate::db::products;
use crate::graphql::Context;
use crate::models::product::{NewProduct, Product, UpdateProduct};
use diesel::PgConnection;
use juniper::{FieldError, FieldResult};

pub struct ProductQuery;
pub struct ProductMutation;

impl ProductQuery {
    pub fn all(ctx: &Context) -> FieldResult<Vec<Product>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match products::all(conn) {
            Ok(products) => Ok(products),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn by_id(ctx: &Context, id: i32) -> FieldResult<Option<Product>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match products::by_id(conn, id) {
            Ok(product) => Ok(Some(product)),
            Err(err) => match err {
                diesel::result::Error::NotFound => FieldResult::Ok(None),
                _ => FieldResult::Err(FieldError::from(err)),
            },
        }
    }
}

impl ProductMutation {
    pub fn new(ctx: &Context, product: NewProduct) -> FieldResult<Product> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match products::new(conn, product) {
            Ok(person) => Ok(person),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn update(ctx: &Context, product: UpdateProduct, id: i32) -> FieldResult<Product> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match products::update(conn, product, id) {
            Ok(product) => Ok(product),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn delete(ctx: &Context, id: i32) -> FieldResult<Product> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match products::delete(conn, id) {
            Ok(product) => Ok(product),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }
}

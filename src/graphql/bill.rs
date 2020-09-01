use crate::db::bills;
use crate::graphql::Context;
use crate::models::bill::{Bill, NewBill, UpdateBill};
use diesel::PgConnection;
use juniper::{FieldError, FieldResult};

pub struct BillQuery;
pub struct BillMutation;

impl BillQuery {
    pub fn all(ctx: &Context) -> FieldResult<Vec<Bill>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match bills::all(conn) {
            Ok(bills) => Ok(bills),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn by_id(ctx: &Context, id: i32) -> FieldResult<Option<Bill>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match bills::by_id(conn, id) {
            Ok(bills) => Ok(Some(bills)),
            Err(err) => match err {
                diesel::result::Error::NotFound => FieldResult::Ok(None),
                _ => FieldResult::Err(FieldError::from(err)),
            },
        }
    }
}

impl BillMutation {
    pub fn new(ctx: &Context, bill: NewBill) -> FieldResult<Bill> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match bills::new(conn, bill) {
            Ok(bill) => Ok(bill),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn update(ctx: &Context, bill: UpdateBill, id: i32) -> FieldResult<Bill> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match bills::update(conn, bill, id) {
            Ok(bill) => Ok(bill),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn delete(ctx: &Context, id: i32) -> FieldResult<Bill> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match bills::delete(conn, id) {
            Ok(bill) => Ok(bill),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }
}

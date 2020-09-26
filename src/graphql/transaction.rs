use crate::db::transactions;
use crate::graphql::Context;
use crate::models::transaction::{NewTransaction, Transaction, UpdateTransaction, NewInputTransaction};
use diesel::PgConnection;
use juniper::{FieldError, FieldResult};

pub struct TransactionQuery;
pub struct TransactionMutation;

impl TransactionQuery {
    pub fn all(ctx: &Context) -> FieldResult<Vec<Transaction>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match transactions::all(conn) {
            Ok(transactions) => Ok(transactions),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn by_id(ctx: &Context, id: i32) -> FieldResult<Option<Transaction>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match transactions::by_id(conn, id) {
            Ok(transactions) => Ok(Some(transactions)),
            Err(err) => match err {
                diesel::result::Error::NotFound => FieldResult::Ok(None),
                _ => FieldResult::Err(FieldError::from(err)),
            },
        }
    }
}

impl TransactionMutation {
    pub fn new(ctx: &Context, transaction: NewTransaction) -> FieldResult<Transaction> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match transactions::new_debug(conn, transaction) {
            Ok(transaction) => Ok(transaction),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn update(
        ctx: &Context,
        transaction: UpdateTransaction,
        id: i32,
    ) -> FieldResult<Transaction> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match transactions::update(conn, transaction, id) {
            Ok(transaction) => Ok(transaction),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn delete(ctx: &Context, id: i32) -> FieldResult<Transaction> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match transactions::delete(conn, id) {
            Ok(transaction) => Ok(transaction),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }
}

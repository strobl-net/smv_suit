use crate::db::transaction_entities;
use crate::graphql::Context;
use crate::models::transaction_entity::{
    NewTransactionEntity, TransactionEntity, UpdateTransactionEntity,
};
use diesel::PgConnection;
use juniper::{FieldError, FieldResult};

pub struct TransactionEntityQuery;
pub struct TransactionEntityMutation;

impl TransactionEntityQuery {
    pub fn all(ctx: &Context) -> FieldResult<Vec<TransactionEntity>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match transaction_entities::all(conn) {
            Ok(transaction_entities) => Ok(transaction_entities),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn by_id(ctx: &Context, id: i32) -> FieldResult<Option<TransactionEntity>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match transaction_entities::by_id(conn, id) {
            Ok(transaction_entity) => Ok(Some(transaction_entity)),
            Err(err) => match err {
                diesel::result::Error::NotFound => FieldResult::Ok(None),
                _ => FieldResult::Err(FieldError::from(err)),
            },
        }
    }
}

impl TransactionEntityMutation {
    pub fn new(
        ctx: &Context,
        transaction_entity: NewTransactionEntity,
    ) -> FieldResult<TransactionEntity> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match transaction_entities::new(conn, transaction_entity) {
            Ok(transaction_entity) => Ok(transaction_entity),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn update(
        ctx: &Context,
        transaction_entity: UpdateTransactionEntity,
        id: i32,
    ) -> FieldResult<TransactionEntity> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match transaction_entities::update(conn, transaction_entity, id) {
            Ok(transaction_entity) => Ok(transaction_entity),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn delete(ctx: &Context, id: i32) -> FieldResult<TransactionEntity> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match transaction_entities::delete(conn, id) {
            Ok(transaction_entity) => Ok(transaction_entity),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }
}

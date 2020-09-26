use crate::models::Expandable;
use crate::{
    models::transaction_entity::{
        ExpandedTransactionEntity, NewTransactionEntity, TransactionEntity, UpdateTransactionEntity,
    },
    schema::{
        transaction_entities,
        transaction_entities::dsl::transaction_entities as transaction_entities_query,
    },
};
use diesel::prelude::*;

pub fn all(conn: &PgConnection) -> QueryResult<Vec<TransactionEntity>> {
    transaction_entities_query
        .order(transaction_entities::id.asc())
        .load::<TransactionEntity>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<TransactionEntity> {
    transaction_entities_query
        .find(id)
        .get_result::<TransactionEntity>(conn)
}

pub fn by_id_expanded(conn: &PgConnection, id: i32) -> ExpandedTransactionEntity {
    let transaction_entity = by_id(conn, id).unwrap();
    transaction_entity.expand(&conn)
}

pub fn new(
    conn: &PgConnection,
    transaction_entity: NewTransactionEntity,
) -> QueryResult<TransactionEntity> {
    diesel::insert_into(transaction_entities::table)
        .values(transaction_entity)
        .get_result::<TransactionEntity>(conn)
}

pub fn update(
    conn: &PgConnection,
    transaction_entity: UpdateTransactionEntity,
    id: i32,
) -> QueryResult<TransactionEntity> {
    diesel::update(transaction_entities_query.find(id))
        .set(transaction_entity)
        .get_result::<TransactionEntity>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<TransactionEntity> {
    diesel::delete(transaction_entities_query.find(id)).get_result::<TransactionEntity>(conn)
}

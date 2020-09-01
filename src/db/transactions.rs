use crate::{
    models::transaction::{NewTransaction, Transaction, UpdateTransaction},
    schema::{transactions, transactions::dsl::transactions as transactions_query},
};
use diesel::prelude::*;

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Transaction>> {
    transactions_query
        .order(transactions::id.asc())
        .load::<Transaction>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Transaction> {
    transactions_query.find(id).get_result::<Transaction>(conn)
}

pub fn new(conn: &PgConnection, transaction: NewTransaction) -> QueryResult<Transaction> {
    diesel::insert_into(transactions::table)
        .values(transaction)
        .get_result::<Transaction>(conn)
}

pub fn update(
    conn: &PgConnection,
    transaction: UpdateTransaction,
    id: i32,
) -> QueryResult<Transaction> {
    diesel::update(transactions_query.find(id))
        .set(transaction)
        .get_result::<Transaction>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<Transaction> {
    diesel::delete(transactions_query.find(id)).get_result::<Transaction>(conn)
}

use crate::models::money_node::NewMoneyNode;
use crate::models::transaction::{ExpandedTransaction, NewInputTransaction};
use crate::models::Expandable;
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

pub fn all_expanded(conn: &PgConnection) -> Vec<ExpandedTransaction> {
    let transactions = all(conn).unwrap();
    let mut expanded_transactions = Vec::new();
    for transaction in transactions {
        expanded_transactions.push(transaction.expand(conn))
    }
    expanded_transactions
}

pub fn by_id_expanded(conn: &PgConnection, id: i32) -> ExpandedTransaction {
    let transaction = by_id(conn, id).unwrap();
    transaction.expand(&conn)
}

pub fn new(conn: &PgConnection, transaction: NewInputTransaction) -> QueryResult<Transaction> {
    use crate::db::money_nodes as other;

    let money_node =
        other::new(conn, NewMoneyNode::from_input(transaction.clone().into())).unwrap();
    let mut new_transaction: NewTransaction = NewTransaction::from_input(transaction.into());
    new_transaction.money_node = money_node.id;

    diesel::insert_into(transactions::table)
        .values(new_transaction)
        .get_result::<Transaction>(conn)
}

pub fn new_debug(conn: &PgConnection, transaction: NewTransaction) -> QueryResult<Transaction> {
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

pub fn delete(conn: &PgConnection, id: i32) -> Transaction {
    let transaction = diesel::delete(transactions_query.find(id)).get_result::<Transaction>(conn).unwrap();
    super::money_nodes::delete(conn, transaction.money_node).unwrap();
    transaction
}

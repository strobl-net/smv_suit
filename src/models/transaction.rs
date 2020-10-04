use crate::db::types::{Branch, Currency};
use crate::models::money_node::{InputMoneyNode, MoneyNode};
use crate::models::transaction_entity::ExpandedTransactionEntity;
use crate::models::Expandable;
use crate::schema::transactions;
use chrono::NaiveDateTime;
use diesel::PgConnection;
use serde::{Deserialize, Serialize};
use std::cmp::PartialEq;

#[derive(Debug, Serialize)]
pub struct ExpandedTransaction {
    pub id: i32,
    pub description: Option<String>,
    pub sender: ExpandedTransactionEntity,
    pub sender_local: bool,
    pub receiver: ExpandedTransactionEntity,
    pub receiver_local: bool,
    pub money_node: MoneyNode,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl Expandable<ExpandedTransaction> for Transaction {
    fn expand(self, conn: &PgConnection) -> ExpandedTransaction {
        let expanded_sender = crate::db::transaction_entities::by_id_expanded(conn, self.sender);

        let expanded_receiver =
            crate::db::transaction_entities::by_id_expanded(conn, self.receiver);

        let money_node = crate::db::money_nodes::by_id(conn, self.money_node).unwrap();

        ExpandedTransaction {
            id: self.id,
            description: self.description,
            sender: expanded_sender,
            sender_local: false,
            receiver: expanded_receiver,
            receiver_local: false,
            money_node,
            added: self.added,
            changed: self.changed,
        }
    }
}

#[derive(GraphQLObject, Identifiable, Associations, Queryable, PartialEq, Debug, Serialize, Deserialize)]
#[belongs_to(MoneyNode, foreign_key = "money_node")]
pub struct Transaction {
    pub id: i32,
    pub description: Option<String>,
    pub sender: i32,
    // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32,
    // TransactionEntity ID
    pub receiver_local: bool,
    pub money_node: i32,
    // MoneyNode ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable)]
#[table_name = "transactions"]
pub struct NewTransaction {
    pub description: Option<String>,
    pub sender: i32,
    // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32,
    // TransactionEntity ID
    pub receiver_local: bool,
    pub money_node: i32,
    // MoneyNode ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewTransaction {
    pub fn from_input(input: InputTransaction) -> Self {
        Self {
            description: input.description,
            sender: input.sender,
            sender_local: input.sender_local,
            receiver: input.receiver,
            receiver_local: input.receiver_local,
            money_node: input.money_node,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

// Combination of Transaction and MoneyNode
#[derive(GraphQLInputObject, Debug, Clone, Deserialize)]
pub struct NewInputTransaction {
    pub description: Option<String>,
    pub sender: i32,
    // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32,
    // TransactionEntity ID
    pub receiver_local: bool,
    pub branch: Branch,
    pub change: i32,
    pub currency: Currency,
    pub processed: bool,
}

impl From<NewInputTransaction> for InputTransaction {
    fn from(input: NewInputTransaction) -> Self {
        Self {
            description: input.description,
            sender: input.sender,
            sender_local: input.sender_local,
            receiver: input.receiver,
            receiver_local: input.receiver_local,
            money_node: -1,
        }
    }
}

impl From<NewInputTransaction> for InputMoneyNode {
    fn from(input: NewInputTransaction) -> Self {
        Self {
            branch: input.branch,
            change: input.change,
            currency: input.currency,
            processed: input.processed,
        }
    }
}

#[derive(GraphQLInputObject, Debug, Clone, Deserialize)]
pub struct InputTransaction {
    pub description: Option<String>,
    pub sender: i32,
    // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32,
    // TransactionEntity ID
    pub receiver_local: bool,
    pub money_node: i32, // MoneyNode ID
}

#[derive(Debug, AsChangeset)]
#[table_name = "transactions"]
pub struct UpdateTransaction {
    pub description: Option<String>,
    pub sender: Option<i32>,
    // TransactionEntity ID
    pub sender_local: Option<bool>,
    pub receiver: Option<i32>,
    // TransactionEntity ID
    pub receiver_local: Option<bool>,
    // MoneyNode ID
    pub money_node: Option<i32>,
    pub changed: Option<NaiveDateTime>,
}

impl UpdateTransaction {
    pub fn from_input(input: InputUpdateTransaction) -> Self {
        Self {
            description: input.description,
            sender: input.sender,
            sender_local: input.sender_local,
            receiver: input.receiver,
            receiver_local: input.receiver_local,
            money_node: input.money_node_id,
            changed: Some(chrono::Utc::now().naive_utc()),
        }
    }
}

#[derive(GraphQLInputObject, Clone, Debug, Deserialize)]
pub struct InputUpdateTransaction {
    pub description: Option<String>,
    pub sender: Option<i32>,
    // TransactionEntity ID
    pub sender_local: Option<bool>,
    pub receiver: Option<i32>,
    // TransactionEntity ID
    pub receiver_local: Option<bool>,
    // MoneyNode ID
    pub money_node_id: Option<i32>,
    pub money_branch: Option<Branch>,
    pub money_change: Option<i32>,
    pub money_currency: Option<Currency>,
    pub money_processed: Option<bool>,
}

use crate::schema::transactions;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};
use crate::db::types::{Currency, Branch};
use crate::models::money_node::{NewMoneyNode, InputMoneyNode};

#[derive(Queryable, GraphQLObject, Debug, Serialize, Deserialize)]
pub struct Transaction {
    pub id: i32,
    pub description: Option<String>,
    pub sender: i32, // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32, // TransactionEntity ID
    pub receiver_local: bool,
    pub money_node: i32, // MoneyNode ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable, Serialize, Deserialize)]
#[table_name = "transactions"]
pub struct NewTransaction {
    pub description: Option<String>,
    pub sender: i32, // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32, // TransactionEntity ID
    pub receiver_local: bool,
    pub money_node: i32, // MoneyNode ID
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
#[derive(GraphQLInputObject, Debug, Clone, Serialize, Deserialize)]
pub struct NewInputTransaction {
    pub description: Option<String>,
    pub sender: i32, // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32, // TransactionEntity ID
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
            money_node: -1
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

#[derive(GraphQLInputObject, Debug, Clone, Serialize, Deserialize)]
pub struct InputTransaction {
    pub description: Option<String>,
    pub sender: i32, // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32, // TransactionEntity ID
    pub receiver_local: bool,
    pub money_node: i32, // MoneyNode ID
}

#[derive(AsChangeset, GraphQLInputObject, Serialize, Deserialize)]
#[table_name = "transactions"]
pub struct UpdateTransaction {
    pub description: Option<String>,
    pub sender: Option<i32>, // TransactionEntity ID
    pub sender_local: Option<bool>,
    pub receiver: Option<i32>, // TransactionEntity ID
    pub receiver_local: Option<bool>,
    pub money_node: Option<i32>, // MoneyNode ID
}

use crate::schema::bills;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};
use crate::db::types::{Branch, Currency};
use crate::models::money_node::NewMoneyNode;
use crate::models::transaction::{NewTransaction, NewInputTransaction};

#[derive(Queryable, GraphQLObject, Debug, Serialize, Deserialize)]
pub struct Bill {
    pub id: i32,
    pub received: NaiveDateTime,
    pub processed: Option<NaiveDateTime>,
    pub products: Option<Vec<i32>>,
    pub responsible: Option<i32>, // User ID
    pub transaction: i32,         // Transaction ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable, Serialize, Deserialize)]
#[table_name = "bills"]
pub struct NewBill {
    pub received: NaiveDateTime,
    pub processed: Option<NaiveDateTime>,
    pub products: Option<Vec<i32>>,
    pub responsible: Option<i32>, // User ID
    pub transaction: i32,         // Transaction ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewBill {
    pub fn from_input(input: InputBill) -> Self {
        Self {
            received: input.received,
            processed: input.processed,
            products: input.products,
            responsible: input.responsible,
            transaction: input.transaction,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

// Combination of Bill, Transaction and MoneyNode
#[derive(GraphQLInputObject, Debug, Clone, Serialize, Deserialize)]
pub struct NewInputBill {
    pub received: NaiveDateTime,
    pub processed_datetime: Option<NaiveDateTime>,
    pub products: Option<Vec<i32>>,
    pub responsible: Option<i32>, // User ID
    // transaction
    pub description: Option<String>,
    pub sender: i32, // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32, // TransactionEntity ID
    pub receiver_local: bool,
    // money_node
    pub branch: Branch,
    pub change: i32,
    pub currency: Currency,
    pub processed: bool,
}

impl From<NewInputBill> for InputBill {
    fn from(input: NewInputBill) -> Self {
        Self {
            received: input.received,
            processed: input.processed_datetime,
            products: input.products,
            responsible: input.responsible,
            transaction: -1
        }
    }
}

impl From<NewInputBill> for NewInputTransaction {
    fn from(input: NewInputBill) -> Self {
        Self {
            description: input.description,
            sender: input.sender,
            sender_local: input.sender_local,
            receiver: input.receiver,
            receiver_local: input.receiver_local,
            branch: input.branch,
            change: input.change,
            currency: input.currency,
            processed: input.processed
        }
    }
}

#[derive(GraphQLInputObject, Serialize, Deserialize)]
pub struct InputBill {
    pub received: NaiveDateTime,
    pub processed: Option<NaiveDateTime>,
    pub products: Option<Vec<i32>>,
    pub responsible: Option<i32>, // User ID
    pub transaction: i32,         // Transaction ID
}

#[derive(AsChangeset, GraphQLInputObject, Serialize, Deserialize)]
#[table_name = "bills"]
pub struct UpdateBill {
    pub received: Option<NaiveDateTime>,
    pub processed: Option<NaiveDateTime>,
    pub products: Option<Vec<i32>>,
    pub responsible: Option<i32>, // User ID
    pub transaction: Option<i32>, // Transaction ID
}
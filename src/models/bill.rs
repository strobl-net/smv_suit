use crate::db::types::{Branch, Currency};
use crate::models::person::Person;
use crate::models::product::ExpandedProduct;
use crate::models::transaction::{ExpandedTransaction, NewInputTransaction, Transaction};
use crate::models::Expandable;
use crate::schema::bills;
use chrono::NaiveDateTime;
use diesel::PgConnection;
use serde::{Deserialize, Serialize};
use std::cmp::PartialEq;

#[derive(Debug, Serialize)]
pub struct ExpandedBill {
    pub id: i32,
    pub received: NaiveDateTime,
    pub processed: Option<NaiveDateTime>,
    pub products: Option<Vec<ExpandedProduct>>,
    pub responsible: Option<Person>,
    pub transaction: ExpandedTransaction,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl Expandable<ExpandedBill> for Bill {
    fn expand(self, conn: &PgConnection) -> ExpandedBill {
        let mut products = Vec::new();
        let mut responsible = None;
        let transaction = crate::db::transactions::by_id_expanded(conn, self.transaction);
        if let Some(product_ids) = self.products {
            for id in product_ids {
                products.push(crate::db::products::by_id_expanded(conn, id))
            }
        }
        if let Some(responsible_id) = self.responsible {
            responsible = Some(crate::db::persons::by_id(conn, responsible_id).unwrap());
        }
        ExpandedBill {
            id: self.id,
            received: self.received,
            processed: self.processed,
            products: Some(products),
            responsible,
            transaction,
            added: self.added,
            changed: self.changed,
        }
    }
}

#[derive(GraphQLObject, Identifiable, Associations, Queryable, PartialEq, Debug, Serialize, Deserialize)]
#[belongs_to(Transaction, foreign_key = "transaction")]
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

#[derive(Insertable)]
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
#[derive(GraphQLInputObject, Debug, Clone, Deserialize)]
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
            transaction: -1,
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
            processed: input.processed,
        }
    }
}

#[derive(GraphQLInputObject, Deserialize)]
pub struct InputBill {
    pub received: NaiveDateTime,
    pub processed: Option<NaiveDateTime>,
    pub products: Option<Vec<i32>>,
    pub responsible: Option<i32>, // User ID
    pub transaction: i32,         // Transaction ID
}

#[derive(Debug, AsChangeset)]
#[table_name = "bills"]
pub struct UpdateBill {
    pub received: Option<NaiveDateTime>,
    pub processed: Option<NaiveDateTime>,
    pub products: Option<Vec<i32>>,
    pub responsible: Option<i32>, // User ID
    pub transaction: Option<i32>, // Transaction ID
    pub changed: Option<NaiveDateTime>
}

impl UpdateBill {
    pub fn from_input(input: InputUpdateBill) -> Self {
        Self {
            received: input.received,
            processed: input.processed,
            products: input.products,
            responsible: input.responsible,
            transaction: input.transaction,
            changed: Some(chrono::Utc::now().naive_utc()),
        }
    }
}

#[derive(GraphQLInputObject, Debug, Deserialize)]
pub struct InputUpdateBill {
    pub received: Option<NaiveDateTime>,
    pub processed: Option<NaiveDateTime>,
    pub products: Option<Vec<i32>>,
    pub responsible: Option<i32>, // User ID
    pub transaction: Option<i32>, // Transaction ID
}

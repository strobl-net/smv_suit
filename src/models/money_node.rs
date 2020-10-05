use crate::db::types::{Branch, Currency};
use crate::models::transaction::InputUpdateTransaction;
use crate::schema::money_nodes;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};

#[derive(GraphQLObject, Queryable, Debug, Serialize, Deserialize)]
pub struct MoneyNode {
    pub id: i32,
    pub branch: Branch,
    pub change: i32,
    pub currency: Currency,
    pub processed: bool,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable, Debug)]
#[table_name = "money_nodes"]
pub struct NewMoneyNode {
    pub branch: Branch,
    pub change: i32,
    pub currency: Currency,
    pub processed: bool,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewMoneyNode {
    pub fn from_input(input: InputMoneyNode) -> Self {
        Self {
            branch: input.branch,
            change: input.change,
            currency: input.currency,
            processed: input.processed,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject, Deserialize)]
pub struct InputMoneyNode {
    pub branch: Branch,
    pub change: i32,
    pub currency: Currency,
    pub processed: bool,
}

#[derive(Debug, AsChangeset)]
#[table_name = "money_nodes"]
pub struct UpdateMoneyNode {
    pub branch: Option<Branch>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub processed: Option<bool>,
    pub changed: Option<NaiveDateTime>,
}

impl UpdateMoneyNode {
    pub fn from_input(input: InputUpdateMoneyNode) -> Self {
        Self {
            branch: input.branch,
            change: input.change,
            currency: input.currency,
            processed: input.processed,
            changed: Some(chrono::Utc::now().naive_utc()),
        }
    }

    pub fn from_input_transaction(input: InputUpdateTransaction) -> Self {
        Self {
            branch: input.money_branch,
            change: input.money_change,
            currency: input.money_currency,
            processed: input.money_processed,
            changed: Some(chrono::Utc::now().naive_utc()),
        }
    }
}
#[derive(GraphQLInputObject, Debug, Deserialize)]
pub struct InputUpdateMoneyNode {
    pub branch: Option<Branch>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub processed: Option<bool>,
}

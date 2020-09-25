use crate::db::types::{Branch, Currency};
use crate::schema::money_nodes;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};

#[derive(Queryable, GraphQLObject, Debug, Serialize, Deserialize)]
pub struct MoneyNode {
    pub id: i32,
    pub branch: Branch,
    pub change: i32,
    pub currency: Currency,
    pub processed: bool,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable, Serialize, Deserialize)]
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

#[derive(GraphQLInputObject, Serialize, Deserialize)]
pub struct InputMoneyNode {
    pub branch: Branch,
    pub change: i32,
    pub currency: Currency,
    pub processed: bool,
}

#[derive(AsChangeset, GraphQLInputObject, Serialize, Deserialize)]
#[table_name = "money_nodes"]
pub struct UpdateMoneyNode {
    pub branch: Option<Branch>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub processed: Option<bool>,
}

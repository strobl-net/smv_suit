use crate::db::types::Currency;
use crate::schema::products;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};

#[derive(GraphQLObject, Queryable, Debug, Serialize, Deserialize)]
pub struct Product {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub provider: Option<i32>, // TransactionEntity ID
    pub tags: Option<Vec<String>>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable)]
#[table_name = "products"]
pub struct NewProduct {
    pub name: String,
    pub description: Option<String>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub provider: Option<i32>, // TransactionEntity ID
    pub tags: Option<Vec<String>>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewProduct {
    pub fn from_input(input: InputProduct) -> Self {
        Self {
            name: input.name,
            description: input.description,
            change: input.change,
            currency: input.currency,
            provider: input.provider,
            tags: input.tags,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject, Deserialize)]
pub struct InputProduct {
    pub name: String,
    pub description: Option<String>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub provider: Option<i32>, // Organisation ID
    pub tags: Option<Vec<String>>,
}

#[derive(GraphQLInputObject, AsChangeset, Deserialize)]
#[table_name = "products"]
pub struct UpdateProduct {
    pub name: Option<String>,
    pub description: Option<String>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub provider: Option<i32>, // Organisation ID
    pub tags: Option<Vec<String>>,
}

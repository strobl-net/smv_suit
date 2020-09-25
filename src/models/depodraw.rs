use crate::schema::depodraws;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};

#[derive(Queryable, GraphQLObject, Debug, Serialize, Deserialize)]
pub struct Depodraw {
    pub id: i32,
    pub description: Option<String>,
    pub transaction_up: i32,   // Transaction ID
    pub transaction_down: i32, // Transaction ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable, Serialize, Deserialize)]
#[table_name = "depodraws"]
pub struct NewDepodraw {
    pub description: Option<String>,
    pub transaction_up: i32,   // Transaction ID
    pub transaction_down: i32, // Transaction ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewDepodraw {
    pub fn from_input(input: InputDepodraw) -> Self {
        Self {
            description: input.description,
            transaction_up: input.transaction_up,
            transaction_down: input.transaction_down,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject, Serialize, Deserialize)]
pub struct InputDepodraw {
    pub description: Option<String>,
    pub transaction_up: i32,   // Transaction ID
    pub transaction_down: i32, // Transaction ID
}

#[derive(AsChangeset, GraphQLInputObject, Serialize, Deserialize)]
#[table_name = "depodraws"]
pub struct UpdateDepodraw {
    pub description: Option<String>,
    pub transaction_up: Option<i32>,   // Transaction ID
    pub transaction_down: Option<i32>, // Transaction ID
}

use crate::schema::depodraws;
use chrono::NaiveDateTime;

#[derive(Queryable, GraphQLObject, Debug)]
pub struct Depdraw {
    pub id: i32,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable)]
#[table_name = "depodraws"]
pub struct NewDepdraw {
    pub description: Option<String>,
    pub transaction_up: i32, // Transaction ID
    pub transaction_down: i32, // Transaction ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewDepdraw {
    pub fn from_input(input: InputDepdraw) -> Self {
        Self {
            description: input.description,
            transaction_up: input.transaction_up,
            transaction_down: input.transaction_down,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject)]
pub struct InputDepdraw {
    pub description: Option<String>,
    pub transaction_up: i32, // Transaction ID
    pub transaction_down: i32, // Transaction ID
}

#[derive(AsChangeset, GraphQLInputObject)]
#[table_name = "depodraws"]
pub struct UpdateDepdraw {
    pub description: Option<String>,
    pub transaction_up: Option<i32>, // Transaction ID
    pub transaction_down: Option<i32>, // Transaction ID
}

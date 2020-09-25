use crate::schema::statement_of_accounts;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};

#[derive(Queryable, GraphQLObject, Debug, Serialize, Deserialize)]
pub struct StatementOfAccount {
    pub id: i32,
    pub description: Option<String>,
    pub starting: NaiveDateTime,
    pub ending: NaiveDateTime,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable, Serialize, Deserialize)]
#[table_name = "statement_of_accounts"]
pub struct NewStatementOfAccount {
    pub description: Option<String>,
    pub starting: NaiveDateTime,
    pub ending: NaiveDateTime,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewStatementOfAccount {
    pub fn from_input(input: InputStatementOfAccount) -> Self {
        Self {
            description: input.description,
            starting: input.starting,
            ending: input.ending,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject, Serialize, Deserialize)]
pub struct InputStatementOfAccount {
    pub description: Option<String>,
    pub starting: NaiveDateTime,
    pub ending: NaiveDateTime,
}

#[derive(AsChangeset, GraphQLInputObject, Serialize, Deserialize)]
#[table_name = "statement_of_accounts"]
pub struct UpdateStatementOfAccount {
    pub description: Option<String>,
    pub starting: Option<NaiveDateTime>,
    pub ending: Option<NaiveDateTime>,
}

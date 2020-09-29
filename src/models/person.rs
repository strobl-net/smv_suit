use crate::schema::persons;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};

#[derive(GraphQLObject, PartialEq, Queryable, Debug, Serialize, Deserialize)]
pub struct Person {
    pub id: i32,
    pub name: String,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Vec<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable)]
#[table_name = "persons"]
pub struct NewPerson {
    pub name: String,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Vec<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewPerson {
    pub fn from_input(input: InputPerson) -> Self {
        Self {
            name: input.name,
            email: input.email.clone(),
            phone: input.phone.clone(),
            tags: input.tags,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject, Debug, Deserialize)]
pub struct InputPerson {
    pub name: String,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Vec<String>,
}

#[derive(Debug, AsChangeset)]
#[table_name = "persons"]
pub struct UpdatePerson {
    pub name: Option<String>,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Option<Vec<String>>,
    pub changed: Option<NaiveDateTime>,
}

impl UpdatePerson {
    pub fn from_input(input: InputUpdatePerson) -> Self {
        Self {
            name: input.name,
            email: input.email.clone(),
            phone: input.phone.clone(),
            tags: input.tags,
            changed: Some(chrono::Utc::now().naive_utc()),
        }
    }
}

#[derive(GraphQLInputObject, Debug, Deserialize)]
pub struct InputUpdatePerson {
    pub name: Option<String>,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Option<Vec<String>>,
}

#[derive(Queryable, Debug, Deserialize)]
pub struct QueryPerson {
    pub name: Option<String>,
    pub tags: Option<Vec<String>>,
}

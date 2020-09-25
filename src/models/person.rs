use crate::schema::persons;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};

#[derive(Queryable, GraphQLObject, Debug, Serialize, Deserialize)]
pub struct Person {
    pub id: i32,
    pub name: String,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Vec<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable, Serialize, Deserialize)]
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

#[derive(GraphQLInputObject, Serialize, Deserialize)]
pub struct InputPerson {
    pub name: String,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Vec<String>,
}

#[derive(AsChangeset, GraphQLInputObject, Serialize, Deserialize)]
#[table_name = "persons"]
pub struct UpdatePerson {
    pub name: Option<String>,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Option<Vec<String>>,
}

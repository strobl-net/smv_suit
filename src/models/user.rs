use serde::{Serialize, Deserialize};
use crate::schema::users;

#[derive(Debug, Identifiable, Queryable, Serialize, Deserialize, PartialEq)]
pub struct User {
    pub id: i32,
    pub username: String,
    pub email: Option<String>,
    pub profile: Option<i32>,
    pub password: String,
    pub login_session: String,
}

#[derive(Debug, Insertable, Serialize, Deserialize)]
#[table_name = "users"]
pub struct RegisterUser {
    pub username: String,
    pub email: Option<String>,
    pub password: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Login {
    pub username_or_email: String,
    pub login_session: String,
}


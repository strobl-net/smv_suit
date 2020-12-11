use crate::{
    models::user::{User, RegisterUser, Login},
    schema::{users, users::dsl::users as user_query}
};
use diesel::prelude::*;

pub fn get_by_username(username: &str, conn: &PgConnection) -> QueryResult<User> {
    user_query
        .filter(users::username.eq( username))
        .first(conn)
}
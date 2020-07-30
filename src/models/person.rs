use crate::schema::persons;
use chrono::NaiveDateTime;

#[derive(Queryable, GraphQLObject, Debug)]
pub struct Person {
    pub id: i32,
    pub name: String,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Vec<String>,
    pub date_added: NaiveDateTime,
}

#[derive(Insertable, GraphQLInputObject)]
#[table_name = "persons"]
pub struct NewPerson {
    pub name: String,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Vec<String>,
    pub date_added: NaiveDateTime,
}

#[derive(AsChangeset, GraphQLInputObject)]
#[table_name = "persons"]
pub struct UpdatePerson {
    pub name: Option<String>,
    pub email: Option<String>,
    pub phone: Option<String>,
    pub tags: Option<Vec<String>>,
}

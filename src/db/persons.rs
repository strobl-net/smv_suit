use diesel::prelude::*;
use crate::{
    models::person::{NewPerson, Person, UpdatePerson},
    schema::{persons, persons::dsl::persons as person_query},
};

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Person>> {
    person_query.order(persons::id.asc()).load::<Person>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Person> {
    person_query.find(id).get_result::<Person>(conn)
}

pub fn new(conn: &PgConnection, person: NewPerson) -> QueryResult<Person> {
    diesel::insert_into(persons::table)
        .values(person)
        .get_result::<Person>(conn)
}

pub fn update(conn: &PgConnection, person: UpdatePerson, id: i32) -> QueryResult<Person> {
    diesel::update(person_query.find(id))
        .set(person)
        .get_result::<Person>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<Person> {
    diesel::delete(person_query.find(id)).get_result::<Person>(conn)
}

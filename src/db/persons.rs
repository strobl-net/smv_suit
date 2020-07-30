use crate::{
    models::person::{NewPerson, Person, UpdatePerson},
    schema::{persons, persons::dsl::persons as person_query},
};
use diesel::prelude::*;

pub async fn all(conn: &PgConnection) -> QueryResult<Vec<Person>> {
    person_query.order(persons::id.desc()).load::<Person>(conn)
}

pub async fn by_id(id: i32, conn: &PgConnection) -> QueryResult<Person> {
    person_query.find(id).get_result::<Person>(conn)
}

pub async fn new(person: NewPerson, conn: &PgConnection) -> QueryResult<Person> {
    diesel::insert_into(persons::table)
        .values(person)
        .get_result::<Person>(conn)
}

pub async fn update(id: i32, person: UpdatePerson, conn: &PgConnection) -> QueryResult<Person> {
    diesel::update(person_query.find(id)).set(person).get_result::<Person>(conn)

}

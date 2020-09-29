use crate::models::person::QueryPerson;
use crate::{
    models::person::{NewPerson, Person, UpdatePerson},
    schema::{persons, persons::dsl::persons as person_query},
};
use diesel::prelude::*;

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Person>> {
    person_query.order(persons::id.asc()).load::<Person>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Person> {
    person_query.find(id).get_result::<Person>(conn)
}

pub fn by_query(conn: &PgConnection, query: QueryPerson) -> QueryResult<Vec<Person>> {
    let mut persons: Vec<Person> = Vec::new();

    if let Some(name) = query.name {
        let results = person_query
            .filter(persons::name.ilike(format!("%{}%", name)))
            .load::<Person>(conn)?;

        persons.extend(results);
    }
    if let Some(tags) = query.tags {
        let results = person_query
            .filter(persons::tags.contains(tags))
            .load::<Person>(conn)?;

        let mut tmp_vec: Vec<Person> = Vec::new();
        for person in persons {
            if results.contains(&person) {
                tmp_vec.push(person);
            }
        }
        persons = tmp_vec;
    }

    Ok(persons)
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

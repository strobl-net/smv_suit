use crate::{
    models::depodraw::{Depodraw, NewDepodraw, UpdateDepodraw},
    schema::{depodraws, depodraws::dsl::depodraws as depodraws_query},
};
use diesel::prelude::*;

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Depodraw>> {
    depodraws_query
        .order(depodraws::id.asc())
        .load::<Depodraw>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Depodraw> {
    depodraws_query.find(id).get_result::<Depodraw>(conn)
}

pub fn new(conn: &PgConnection, depodraw: NewDepodraw) -> QueryResult<Depodraw> {
    diesel::insert_into(depodraws::table)
        .values(depodraw)
        .get_result::<Depodraw>(conn)
}

pub fn update(conn: &PgConnection, depodraw: UpdateDepodraw, id: i32) -> QueryResult<Depodraw> {
    diesel::update(depodraws_query.find(id))
        .set(depodraw)
        .get_result::<Depodraw>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<Depodraw> {
    diesel::delete(depodraws_query.find(id)).get_result::<Depodraw>(conn)
}

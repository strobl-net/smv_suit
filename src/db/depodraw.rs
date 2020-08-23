use diesel::prelude::*;
use crate::{
    models::depodraw::{NewDepdraw, Depdraw, UpdateDepdraw},
    schema::{depodraws, depodraws::dsl::depodraws as depodraws_query},
};

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Depdraw>> {
    depodraws_query.order(depodraws::id.asc()).load::<Depdraw>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Depdraw> {
    depodraws_query.find(id).get_result::<Depdraw>(conn)
}

pub fn new(conn: &PgConnection, depodraw: NewDepdraw) -> QueryResult<Depdraw> {
    diesel::insert_into(depodraws::table)
        .values(depodraw)
        .get_result::<Depdraw>(conn)
}

pub fn update(conn: &PgConnection, depodraw: UpdateDepdraw, id: i32) -> QueryResult<Depdraw> {
    diesel::update(depodraws_query.find(id))
        .set(depodraw)
        .get_result::<Depdraw>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<Depdraw> {
    diesel::delete(depodraws_query.find(id)).get_result::<Depdraw>(conn)
}

use crate::{
    models::organisation::{NewOrganisation, Organisation, UpdateOrganisation},
    schema::{organisations, organisations::dsl::organisations as organisations_query},
};
use diesel::prelude::*;

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Organisation>> {
    organisations_query
        .order(organisations::id.asc())
        .load::<Organisation>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Organisation> {
    organisations_query
        .find(id)
        .get_result::<Organisation>(conn)
}

pub fn new(conn: &PgConnection, organisation: NewOrganisation) -> QueryResult<Organisation> {
    diesel::insert_into(organisations::table)
        .values(organisation)
        .get_result::<Organisation>(conn)
}

pub fn update(
    conn: &PgConnection,
    organisation: UpdateOrganisation,
    id: i32,
) -> QueryResult<Organisation> {
    diesel::update(organisations_query.find(id))
        .set(organisation)
        .get_result::<Organisation>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<Organisation> {
    diesel::delete(organisations_query.find(id)).get_result::<Organisation>(conn)
}

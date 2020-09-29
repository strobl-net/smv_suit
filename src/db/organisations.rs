use crate::{
    models::organisation::{NewOrganisation, Organisation, UpdateOrganisation},
    schema::{organisations, organisations::dsl::organisations as organisations_query},
};
use diesel::prelude::*;
use crate::models::organisation::QueryOrganisation;

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

pub fn by_query(conn: &PgConnection, query: QueryOrganisation) -> QueryResult<Vec<Organisation>> {
    let mut organisations: Vec<Organisation> = Vec::new();

    if let Some(name) = query.name {
        let results = organisations_query
            .filter(organisations::name.ilike(format!("%{}%", name)))
            .load::<Organisation>(conn)?;

        organisations.extend(results);
    }
    if let Some(description) = query.description {
        let results = organisations_query
            .filter(organisations::name.ilike(format!("%{}%", description)))
            .load::<Organisation>(conn)?;

        let mut tmp_vec: Vec<Organisation> = Vec::new();
        for organisation in organisations {
            if results.contains(&organisation) {
                tmp_vec.push(organisation);
            }
        }
        organisations = tmp_vec;
    }
    if let Some(location) = query.location {
        let results = organisations_query
            .filter(organisations::name.ilike(format!("%{}%", location)))
            .load::<Organisation>(conn)?;

        let mut tmp_vec: Vec<Organisation> = Vec::new();
        for organisation in organisations {
            if results.contains(&organisation) {
                tmp_vec.push(organisation);
            }
        }
        organisations = tmp_vec;
    }

    Ok(organisations)
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

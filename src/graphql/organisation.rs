use crate::graphql::Context;
use crate::db::organisations;
use crate::models::organisation::{NewOrganisation, Organisation, UpdateOrganisation};
use diesel::PgConnection;
use juniper::{FieldError, FieldResult};

pub struct OrganisationQuery;
pub struct OrganisationMutation;

impl OrganisationQuery {
    pub fn all(ctx: &Context) -> FieldResult<Vec<Organisation>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match organisations::all(conn) {
            Ok(organisations) => Ok(organisations),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn by_id(ctx: &Context, id: i32) -> FieldResult<Option<Organisation>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match organisations::by_id(conn, id) {
            Ok(organisation) => Ok(Some(organisation)),
            Err(err) => match err {
                diesel::result::Error::NotFound => FieldResult::Ok(None),
                _ => FieldResult::Err(FieldError::from(err)),
            },
        }
    }
}

impl OrganisationMutation {
    pub fn new(ctx: &Context, organisation: NewOrganisation) -> FieldResult<Organisation> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match organisations::new(conn, organisation) {
            Ok(organisation) => Ok(organisation),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn update(ctx: &Context, organisation: UpdateOrganisation, id: i32) -> FieldResult<Organisation> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match organisations::update(conn, organisation, id) {
            Ok(organisation) => Ok(organisation),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn delete(ctx: &Context, id: i32) -> FieldResult<Organisation> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match organisations::delete(conn, id) {
            Ok(organisation) => Ok(organisation),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }
}

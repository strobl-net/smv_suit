use crate::graphql::Context;
use crate::db::depodraws;
use crate::models::depodraw::{NewDepodraw, Depodraw, UpdateDepodraw};
use diesel::PgConnection;
use juniper::{FieldError, FieldResult};

pub struct DepodrawQuery;
pub struct DepodrawMutation;

impl DepodrawQuery {
    pub fn all(ctx: &Context) -> FieldResult<Vec<Depodraw>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match depodraws::all(conn) {
            Ok(depodraws) => Ok(depodraws),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn by_id(ctx: &Context, id: i32) -> FieldResult<Option<Depodraw>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match depodraws::by_id(conn, id) {
            Ok(depodraw) => Ok(Some(depodraw)),
            Err(err) => match err {
                diesel::result::Error::NotFound => FieldResult::Ok(None),
                _ => FieldResult::Err(FieldError::from(err)),
            },
        }
    }
}

impl DepodrawMutation {
    pub fn new(ctx: &Context, depodraw: NewDepodraw) -> FieldResult<Depodraw> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match depodraws::new(conn, depodraw) {
            Ok(depodraw) => Ok(depodraw),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn update(ctx: &Context, depodraw: UpdateDepodraw, id: i32) -> FieldResult<Depodraw> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match depodraws::update(conn, depodraw, id) {
            Ok(depodraw) => Ok(depodraw),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn delete(ctx: &Context, id: i32) -> FieldResult<Depodraw> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match depodraws::delete(conn, id) {
            Ok(depodraw) => Ok(depodraw),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }
}

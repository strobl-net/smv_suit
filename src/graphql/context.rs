use crate::db::PgPool;

pub struct Context {
    pub pool: PgPool,
}

impl juniper::Context for Context {}

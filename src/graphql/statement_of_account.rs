use crate::db::statement_of_accounts;
use crate::graphql::Context;
use crate::models::statement_of_account::{
    NewStatementOfAccount, StatementOfAccount, UpdateStatementOfAccount,
};
use diesel::PgConnection;
use juniper::{FieldError, FieldResult};

pub struct StatementOfAccountQuery;
pub struct StatementOfAccountMutation;

impl StatementOfAccountQuery {
    pub fn all(ctx: &Context) -> FieldResult<Vec<StatementOfAccount>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match statement_of_accounts::all(conn) {
            Ok(statement_of_accounts) => Ok(statement_of_accounts),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn by_id(ctx: &Context, id: i32) -> FieldResult<Option<StatementOfAccount>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match statement_of_accounts::by_id(conn, id) {
            Ok(statement_of_account) => Ok(Some(statement_of_account)),
            Err(err) => match err {
                diesel::result::Error::NotFound => FieldResult::Ok(None),
                _ => FieldResult::Err(FieldError::from(err)),
            },
        }
    }
}

impl StatementOfAccountMutation {
    pub fn new(
        ctx: &Context,
        statement_of_account: NewStatementOfAccount,
    ) -> FieldResult<StatementOfAccount> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match statement_of_accounts::new(conn, statement_of_account) {
            Ok(statement_of_account) => Ok(statement_of_account),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn update(
        ctx: &Context,
        statement_of_account: UpdateStatementOfAccount,
        id: i32,
    ) -> FieldResult<StatementOfAccount> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match statement_of_accounts::update(conn, statement_of_account, id) {
            Ok(statement_of_account) => Ok(statement_of_account),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn delete(ctx: &Context, id: i32) -> FieldResult<StatementOfAccount> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match statement_of_accounts::delete(conn, id) {
            Ok(statement_of_account) => Ok(statement_of_account),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }
}

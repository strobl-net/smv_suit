use diesel::prelude::*;
use crate::{
    models::statement_of_account::{NewStatementOfAccount, StatementOfAccount, UpdateStatementOfAccount},
    schema::{statement_of_accounts, statement_of_accounts::dsl::statement_of_accounts as statement_of_accounts_query},
};

pub fn all(conn: &PgConnection) -> QueryResult<Vec<StatementOfAccount>> {
    statement_of_accounts_query.order(statement_of_accounts::id.asc()).load::<StatementOfAccount>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<StatementOfAccount> {
    statement_of_accounts_query.find(id).get_result::<StatementOfAccount>(conn)
}

pub fn new(conn: &PgConnection, statement_of_account: NewStatementOfAccount) -> QueryResult<StatementOfAccount> {
    diesel::insert_into(statement_of_accounts::table)
        .values(statement_of_account)
        .get_result::<StatementOfAccount>(conn)
}

pub fn update(conn: &PgConnection, statement_of_account: UpdateStatementOfAccount, id: i32) -> QueryResult<StatementOfAccount> {
    diesel::update(statement_of_accounts_query.find(id))
        .set(statement_of_account)
        .get_result::<StatementOfAccount>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<StatementOfAccount> {
    diesel::delete(statement_of_accounts_query.find(id)).get_result::<StatementOfAccount>(conn)
}

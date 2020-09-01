use crate::graphql::Context;
use crate::db::money_nodes;
use crate::models::money_node::{NewMoneyNode, MoneyNode, UpdateMoneyNode};
use diesel::PgConnection;
use juniper::{FieldError, FieldResult};

pub struct MoneyNodeQuery;
pub struct MoneyNodeMutation;

impl MoneyNodeQuery {
    pub fn all(ctx: &Context) -> FieldResult<Vec<MoneyNode>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match money_nodes::all(conn) {
            Ok(money_nodes) => Ok(money_nodes),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn by_id(ctx: &Context, id: i32) -> FieldResult<Option<MoneyNode>> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match money_nodes::by_id(conn, id) {
            Ok(person) => Ok(Some(person)),
            Err(err) => match err {
                diesel::result::Error::NotFound => FieldResult::Ok(None),
                _ => FieldResult::Err(FieldError::from(err)),
            },
        }
    }
}

impl MoneyNodeMutation {
    pub fn new(ctx: &Context, money_node: NewMoneyNode) -> FieldResult<MoneyNode> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match money_nodes::new(conn, money_node) {
            Ok(money_node) => Ok(money_node),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn update(ctx: &Context, money_node: UpdateMoneyNode, id: i32) -> FieldResult<MoneyNode> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match money_nodes::update(conn, money_node, id) {
            Ok(money_node) => Ok(money_node),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }

    pub fn delete(ctx: &Context, id: i32) -> FieldResult<MoneyNode> {
        let conn: &PgConnection = &ctx.pool.get().unwrap();
        match money_nodes::delete(conn, id) {
            Ok(money_node) => Ok(money_node),
            Err(err) => FieldResult::Err(FieldError::from(err)),
        }
    }
}

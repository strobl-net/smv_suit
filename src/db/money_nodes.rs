use crate::{
    models::money_node::{MoneyNode, NewMoneyNode, UpdateMoneyNode},
    schema::{money_nodes, money_nodes::dsl::money_nodes as money_nodes_query},
};
use diesel::prelude::*;
use crate::db::finance::FilterQuery;

pub fn all(conn: &PgConnection) -> QueryResult<Vec<MoneyNode>> {
    money_nodes_query
        .order(money_nodes::id.asc())
        .load::<MoneyNode>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<MoneyNode> {
    money_nodes_query.find(id).get_result::<MoneyNode>(conn)
}

pub fn new(conn: &PgConnection, money_node: NewMoneyNode) -> QueryResult<MoneyNode> {
    diesel::insert_into(money_nodes::table)
        .values(money_node)
        .get_result::<MoneyNode>(conn)
}

pub fn update(conn: &PgConnection, money_node: UpdateMoneyNode, id: i32) -> QueryResult<MoneyNode> {
    diesel::update(money_nodes_query.find(id))
        .set(money_node)
        .get_result::<MoneyNode>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<MoneyNode> {
    diesel::delete(money_nodes_query.find(id)).get_result::<MoneyNode>(conn)
}

pub fn by_query(conn: &PgConnection, query: FilterQuery) -> QueryResult<Vec<MoneyNode>> {
    let mut db_query = money_nodes_query
        .order(money_nodes::id.asc()).into_boxed();

    if let Some(option) = query.processed {
        db_query = db_query.filter(money_nodes::processed.eq(option))
    }

    if let Some(option) = query.branch {
        db_query = db_query.filter(money_nodes::branch.eq(option))
    }

    if let Some(option) = query.from {
        db_query = db_query.filter(money_nodes::added.ge(option))
    }

    if let Some(option) = query.until {
        db_query = db_query.filter(money_nodes::added.le(option))
    }


    db_query.load::<MoneyNode>(conn)
}

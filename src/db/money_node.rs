use diesel::prelude::*;
use crate::{
    models::money_node::{NewMoneyNode, MoneyNode, UpdateMoneyNode},
    schema::{money_nodes, money_nodes::dsl::money_nodes as money_nodes_query},
};

pub fn all(conn: &PgConnection) -> QueryResult<Vec<MoneyNode>> {
    money_nodes_query.order(money_nodes::id.asc()).load::<MoneyNode>(conn)
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

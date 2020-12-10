use diesel::{PgConnection, QueryResult};
use crate::db::types::Branch;
use chrono::NaiveDateTime;
use crate::db::money_nodes as nodes;
use serde::Deserialize;

pub fn all(conn: &PgConnection) -> i32 {
    let nodes = nodes::all(conn).unwrap();
    nodes.iter().map(|node| node.change).sum()
}

pub fn by_query(conn: &PgConnection, query: FilterQuery) -> i32 {
    let nodes = nodes::by_query(conn, query).unwrap();
    nodes.iter().map(|node| node.change).sum()
}

#[derive(Queryable, Debug, Deserialize)]
pub struct FilterQuery {
    pub processed: Option<bool>,
    pub branch: Option<Branch>,
    pub from: Option<NaiveDateTime>,
    pub until: Option<NaiveDateTime>,
}
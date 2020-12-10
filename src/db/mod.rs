//! Module for all things concerning the database
use crate::config::Config;
use diesel::{pg::PgConnection, r2d2::ConnectionManager};
use r2d2::Pool;

pub mod bills;
pub mod depodraws;
pub mod money_nodes;
pub mod organisations;
pub mod persons;
pub mod products;
pub mod statement_of_accounts;
pub mod transaction_entities;
pub mod transactions;
pub mod types;
pub mod finance;

// no one wants to write a type out this long
pub type PgPool = Pool<ConnectionManager<PgConnection>>;

// creates a new connection manager pool for async database calls
pub fn new_pool(config: &Config) -> PgPool {
    let manager = ConnectionManager::<PgConnection>::new(&config.db_address);
    match config.pool_limit {
        Some(limit) => r2d2::Pool::builder()
            .max_size(limit)
            .build(manager)
            .expect("Unable to build pool"),
        None => r2d2::Pool::builder()
            .build(manager)
            .expect("Unable to build pool"),
    }
}

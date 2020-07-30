use crate::config::Config;
use diesel::{pg::PgConnection, r2d2::ConnectionManager};
use r2d2::Pool;

pub mod persons;

pub type PgPool = Pool<ConnectionManager<PgConnection>>;

pub fn new_pool(config: &Config) -> PgPool {
    let manager = ConnectionManager::<PgConnection>::new(&config.db_link);
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

#[macro_use]
extern crate diesel;

#[macro_use]
extern crate juniper;

use crate::{
    config::Config,
    db::{new_pool, PgPool},
};
use actix_web::{App, HttpServer, middleware};
use log::info;
use std::{env::Args, sync::Arc};

mod config;
mod db;
mod endpoints;
mod graphql;
mod models;
mod schema;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    // Delete latest logging file
    // Disable this in production!
    std::fs::remove_file("output.log")?;

    match setup_logger() {
        Ok(()) => {}
        Err(err) => println!("Error: {}, while configuring logger", err),
    };

    let args: Args = std::env::args();
    let config: Arc<Config> = Arc::new(Config::new(args));
    let pool: PgPool = new_pool(&config);
    let server_address = config.server_address.clone();

    info!("Starting Server with following configuration \n {}", config);
    HttpServer::new(move || {
        App::new()
            .data(config.clone())
            .data(pool.clone())
            .wrap(middleware::Logger::default())
            .configure(endpoints::graphql_endpoints)
    })
    .bind(server_address)?
    .run()
    .await
}

fn setup_logger() -> Result<(), fern::InitError> {
    fern::Dispatch::new()
        .format(|out, message, record| {
            out.finish(format_args!(
                "{}[{}][{}] {}",
                chrono::Local::now().format("[%Y-%m-%d][%H:%M:%S]"),
                record.target(),
                record.level(),
                message
            ))
        })
        .level(log::LevelFilter::Debug)
        .chain(std::io::stdout())
        .chain(fern::log_file("output.log")?)
        .apply()?;
    Ok(())
}

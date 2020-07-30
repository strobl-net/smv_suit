use actix_web::{middleware, App, HttpServer};
use log::info;
use smv_suit::{
    config::Config,
    db::{new_pool, PgPool},
    endpoints, setup_logger,
};
use std::{env::Args, sync::Arc};

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

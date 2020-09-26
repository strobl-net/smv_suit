use actix_cors::Cors;
use actix_web::{middleware, App, HttpServer};
use log::info;
use smv_suit::{
    config::Config,
    db::{new_pool, PgPool},
    endpoints, setup_logger,
};
use std::sync::Arc;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    // Delete latest logging file
    // Disable this in production!
    // TODO: move latest log file into a logfile directory with timestamps.
    match std::fs::read("output.log") {
        Ok(_) => std::fs::remove_file("output.log").unwrap(),
        Err(_) => println!("no log file"),
    };

    match setup_logger() {
        Ok(()) => {}
        Err(err) => println!("Error: {}, while configuring logger", err),
    };

    // Setup Config
    let config: Arc<Config> = Arc::new(Config::new());
    let server_address = config.server_address.clone();
    // log the config
    info!("Starting Server with following configuration \n {}", config);

    let pool: PgPool = new_pool(&config);
    let tera = tera::Tera::new(concat!(env!("CARGO_MANIFEST_DIR"), "/templates/**/*")).unwrap();

    // Edit Cors for production
    HttpServer::new(move || {
        App::new()
            .wrap(Cors::new().supports_credentials().max_age(3600).finish())
            .data(config.clone())
            .data(pool.clone())
            .data(tera.clone())
            .wrap(middleware::Logger::default())
            .configure(endpoints::graphql::endpoints)
            .configure(endpoints::rest::endpoints)
            .configure(endpoints::views::endpoints)
    })
    .bind(server_address)?
    .run()
    .await
}

use actix_web::{get, web, App, HttpServer, Responder};
use std::env::Args;
use crate::config::Config;
use std::sync::Arc;

mod db;
mod graphql;
mod config;

#[get("/{id}/{name}/")]
async fn index(info: web::Path<(u32, String)>) -> impl Responder {
    format!("Hello {}! id:{}", info.1, info.0)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let args: Args = std::env::args();
    let config: Arc<Config> = Arc::new(Config::new(args));
    HttpServer::new(move || App::new()
        .app_data(config.clone())
        .service(index))
        .bind("127.0.0.1:8080")?
        .run()
        .await
}
use crate::db::PgPool;
use crate::graphql;
use crate::graphql::Context;
use crate::graphql::Schema;
use actix_web::{get, post, web, Error, HttpResponse};
use juniper::http::playground::playground_source;
use juniper::http::GraphQLRequest;
use std::sync::Arc;

// Configure all GraphQL endpoints
// called by the actix-web server builder
pub fn endpoints(config: &mut web::ServiceConfig) {
    let schema = Arc::new(graphql::create_schema());
    config
        .data(schema)
        .service(graphql_service)
        .service(graphql_playground_service);
}

// GraphQL API
#[post("/graphql")]
pub async fn graphql_service(
    pool: web::Data<PgPool>,
    schema: web::Data<Arc<Schema>>,
    data: web::Json<GraphQLRequest>,
) -> Result<HttpResponse, Error> {
    let ctx = Context {
        pool: pool.get_ref().to_owned(),
    };

    let result = web::block(move || {
        let result = data.execute(&schema, &ctx);
        Ok::<_, serde_json::error::Error>(serde_json::to_string(&result)?)
    })
    .await
    .map_err(Error::from)?;

    Ok(HttpResponse::Ok()
        .content_type("application/json")
        .body(result))
}

// Graphical GraphQL web-interface
#[get("/graphql")]
pub async fn graphql_playground_service() -> HttpResponse {
    HttpResponse::Ok()
        .content_type("text/html; charset=utf-8")
        .body(playground_source("/graphql"))
}

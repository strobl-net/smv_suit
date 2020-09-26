use actix_web::web::ServiceConfig;
use actix_web::{get, web, HttpResponse, Error};

mod persons;

pub fn endpoints(config: &mut ServiceConfig) {
    config.service(index);
    persons::endpoints(config);
}

#[get("/")]
pub async fn index(tmpl: web::Data<tera::Tera>) -> Result<HttpResponse, Error> {
    let mut ctx = tera::Context::new();
    let body = tmpl.render("index.html", &ctx).unwrap();
    Ok(HttpResponse::Ok().content_type("text/html").body(body))
}
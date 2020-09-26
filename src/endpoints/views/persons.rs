use actix_web::web::ServiceConfig;
use actix_web::{web, Error, HttpResponse, get};

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(all);
}

#[get("/api/g/persons")]
async fn all(tmpl: web::Data<tera::Tera>) -> Result<HttpResponse, Error> {
    let mut ctx = tera::Context::new();
    let body = tmpl.render("models/person.html", &ctx).unwrap();
    Ok(HttpResponse::Ok().content_type("text/html").body(body))
}
use actix_web::web::ServiceConfig;
use actix_web::{get, web, HttpResponse, Error, HttpRequest};

mod persons;

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(index)
        .service(api);
    persons::endpoints(config);
}

#[get("/")]
pub async fn index(tmpl: web::Data<tera::Tera>) -> Result<HttpResponse, Error> {
    let mut ctx = tera::Context::new();
    let body = tmpl.render("index.html", &ctx).unwrap();
    Ok(HttpResponse::Ok().content_type("text/html").body(body))
}

#[get("/api")]
pub async fn api(tmpl: web::Data<tera::Tera>) -> Result<HttpResponse, Error> {
    let mut ctx = tera::Context::new();
    let body = tmpl.render("api.html", &ctx).unwrap();
    Ok(HttpResponse::Ok().content_type("text/html").body(body))
}

pub fn extract_path(req: &HttpRequest) -> (&str, Vec<&str>) {
    let mut path: Vec<&str> = req.path().split("/").collect();
    path.drain(0..1);
    let title: &str = path.last().unwrap();
    (title, path)
}
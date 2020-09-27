use actix_web::web::ServiceConfig;
use actix_web::{web, Error, HttpResponse, get, HttpRequest};
use crate::endpoints::views::extract_path;

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(all);
}

#[get("/api/g/persons")]
async fn all(tmpl: web::Data<tera::Tera>, req: HttpRequest) -> Result<HttpResponse, Error> {
    let mut ctx = tera::Context::new();
    let (title, path) = extract_path(&req);
    ctx.insert("pages", &path);
    ctx.insert("title", &title);
    let body = tmpl.render("models/person.html", &ctx).unwrap();
    Ok(HttpResponse::Ok().content_type("text/html").body(body))
}
use actix_web::web::ServiceConfig;
use actix_web::{web, Error, HttpResponse, get, HttpRequest};
use crate::endpoints::views::extract_path;
use crate::models::person::Person;

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(all);
}

#[get("/api/g/persons")]
async fn all(tmpl: web::Data<tera::Tera>, req: HttpRequest, client: web::Data<reqwest::Client>) -> Result<HttpResponse, Error> {
    let mut ctx = tera::Context::new();
    let persons = client.get("http://localhost:8000/api/persons").send().await.unwrap().json::<Vec<Person>>().await.unwrap();

    let (title, path) = extract_path(&req);
    ctx.insert("pages", &path);
    ctx.insert("title", &title);
    ctx.insert("persons", &persons);
    let body = tmpl.render("models/person.html", &ctx).unwrap();
    Ok(HttpResponse::Ok().content_type("text/html").body(body))
}
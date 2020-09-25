use crate::db::PgPool;
use actix_web::{HttpResponse, Error, web, get};
use crate::db::persons;

pub fn rest_endpoints(config: &mut web::ServiceConfig) {
    config
        .service(get_persons_all)
        .service(get_person_by_id);
}

#[get("/persons")]
pub async fn get_persons_all(pool: web::Data<PgPool>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let person_list = persons::all(&conn).unwrap();
    Ok(HttpResponse::Ok().json(person_list))
}

#[get("/persons/{id}")]
pub async fn get_person_by_id(pool: web::Data<PgPool>, web::Path(id): web::Path<i32>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let person = persons::by_id(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(person))
}
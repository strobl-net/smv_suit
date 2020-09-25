use crate::db::PgPool;
use crate::db::persons;
use crate::models::person::{NewPerson, UpdatePerson};
use actix_web::{HttpResponse, Error, web, get, delete, put};
use actix_web::web::ServiceConfig;

pub fn person_rest_endpoints(config: &mut ServiceConfig) {
    config
        .service(get_persons_all)
        .service(get_person_by_id)
        .service(new_person)
        .service(update_person_by_id)
        .service(delete_person_by_id);
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

#[put("/persons")]
pub async fn new_person(pool: web::Data<PgPool>, web::Path(person): web::Path<NewPerson>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let person = persons::new(&conn, person).unwrap();
    Ok(HttpResponse::Ok().json(person))
}

#[get("/persons/{id}")]
pub async fn update_person_by_id(pool: web::Data<PgPool>, web::Path((person, id)): web::Path<(UpdatePerson, i32)>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let person = persons::update(&conn, person, id).unwrap();
    Ok(HttpResponse::Ok().json(person))
}

#[delete("/persons/{id}")]
pub async fn delete_person_by_id(pool: web::Data<PgPool>, web::Path(id): web::Path<i32>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let person = persons::delete(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(person))
}
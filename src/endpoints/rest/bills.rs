use crate::db::PgPool;
use crate::db::bills as db_items;
use crate::models::bill::{NewBill as NewItem, NewInputBill as NewInputItem, UpdateBill as UpdateItem};
use actix_web::{HttpResponse, Error, web, get, delete, post, patch};
use actix_web::web::ServiceConfig;

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(get_all)
        .service(get_by_id)
        .service(new)
        .service(update_by_id)
        .service(delete_by_id);
}

#[get("/api/bills")]
pub async fn get_all(pool: web::Data<PgPool>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item_list = db_items::all(&conn).unwrap();
    Ok(HttpResponse::Ok().json(item_list))
}

#[get("/api/bills/{id}")]
pub async fn get_by_id(pool: web::Data<PgPool>, web::Path(id): web::Path<i32>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::by_id(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[post("/api/bills")]
pub async fn new(pool: web::Data<PgPool>, web::Path(item): web::Path<NewInputItem>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::new(&conn, item).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[post("/api/d/bills")]
pub async fn new_debug(pool: web::Data<PgPool>, web::Path(item): web::Path<NewItem>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::new_debug(&conn, item).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[patch("/api/bills/{id}")]
pub async fn update_by_id(pool: web::Data<PgPool>, web::Path((item, id)): web::Path<(UpdateItem, i32)>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::update(&conn, item, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[delete("/api/bills/{id}")]
pub async fn delete_by_id(pool: web::Data<PgPool>, web::Path(id): web::Path<i32>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::delete(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}
use crate::db::PgPool;
use crate::db::transaction_entities as db_items;
use crate::models::transaction_entity::{NewTransactionEntity as NewItem, UpdateTransactionEntity as UpdateItem};
use actix_web::{HttpResponse, Error, web, get, delete, put};
use actix_web::web::ServiceConfig;

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(get_all)
        .service(get_by_id)
        .service(put_new)
        .service(update_by_id)
        .service(delete_by_id);
}

#[get("/transaction_entities")]
pub async fn get_all(pool: web::Data<PgPool>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item_list = db_items::all(&conn).unwrap();
    Ok(HttpResponse::Ok().json(item_list))
}

#[get("/transaction_entities/{id}")]
pub async fn get_by_id(pool: web::Data<PgPool>, web::Path(id): web::Path<i32>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::by_id(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[put("/transaction_entities")]
pub async fn put_new(pool: web::Data<PgPool>, web::Path(item): web::Path<NewItem>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::new(&conn, item).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[get("/transaction_entities/{id}")]
pub async fn update_by_id(pool: web::Data<PgPool>, web::Path((item, id)): web::Path<(UpdateItem, i32)>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::update(&conn, item, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[delete("/transaction_entities/{id}")]
pub async fn delete_by_id(pool: web::Data<PgPool>, web::Path(id): web::Path<i32>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::delete(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}
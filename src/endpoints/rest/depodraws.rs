use crate::db::depodraws as db_items;
use crate::db::PgPool;
use crate::models::depodraw::{
    InputDepodraw as NewItem, NewDepodraw as Item, UpdateDepodraw as UpdateItem,
};
use actix_web::web::ServiceConfig;
use actix_web::{delete, get, patch, post, web, Error, HttpResponse};

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(get_all)
        .service(get_by_id)
        .service(new)
        .service(update_by_id)
        .service(delete_by_id);
}

#[get("/api/depodraws")]
pub async fn get_all(pool: web::Data<PgPool>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item_list = db_items::all(&conn).unwrap();
    Ok(HttpResponse::Ok().json(item_list))
}

#[get("/api/depodraws/{id}")]
pub async fn get_by_id(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::by_id(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[post("/api/depodraws")]
pub async fn new(
    pool: web::Data<PgPool>,
    web::Path(item): web::Path<NewItem>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::new(&conn, Item::from_input(item)).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[patch("/api/depodraws/{id}")]
pub async fn update_by_id(
    pool: web::Data<PgPool>,
    web::Path((item, id)): web::Path<(UpdateItem, i32)>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::update(&conn, item, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[delete("/api/depodraws/{id}")]
pub async fn delete_by_id(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::delete(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

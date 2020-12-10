use crate::db::depodraws as db_items;
use crate::db::PgPool;
use crate::models::depodraw::{NewInputDepodraw as NewItem, UpdateDepodraw as UpdateItem, InputUpdateDepodraw as InputUpdateItem, NewInputDepodraw};
use actix_web::web::ServiceConfig;
use actix_web::{delete, get, patch, post, web, Error, HttpResponse};

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(get_all)
        .service(get_by_id)
        .service(get_all_expanded)
        .service(get_by_id_expanded)
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

#[get("/api/e/depodraws")]
pub async fn get_all_expanded(pool: web::Data<PgPool>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item_list = db_items::all_expanded(&conn);
    Ok(HttpResponse::Ok().json(item_list))
}

#[get("/api/e/depodraws/{id}")]
pub async fn get_by_id_expanded(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::by_id_expanded(&conn, id);
    Ok(HttpResponse::Ok().json(item))
}

#[post("/api/depodraws")]
pub async fn new(
    pool: web::Data<PgPool>,
    web::Json(item): web::Json<NewInputDepodraw>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::new(&conn, item).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[patch("/api/depodraws/{id}")]
pub async fn update_by_id(
    pool: web::Data<PgPool>,
    web::Json(item): web::Json<InputUpdateItem>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::update(&conn, UpdateItem::from_input(item), id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[delete("/api/depodraws/{id}")]
pub async fn delete_by_id(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::delete(&conn, id);
    Ok(HttpResponse::Ok().json(item))
}

use crate::db::money_nodes as db_items;
use crate::db::PgPool;
use crate::models::money_node::{
    InputMoneyNode as NewItem, InputUpdateMoneyNode as UpdateInputItem, NewMoneyNode as Item,
    UpdateMoneyNode as UpdateItem,
};
use actix_web::web::ServiceConfig;
use actix_web::{delete, get, patch, post, web, Error, HttpResponse};

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(get_all)
        .service(get_by_id)
        .service(new_debug)
        .service(update_by_id_debug)
        .service(delete_by_id_debug);
}

#[get("api/money_nodes")]
pub async fn get_all(pool: web::Data<PgPool>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item_list = db_items::all(&conn).unwrap();
    Ok(HttpResponse::Ok().json(item_list))
}

#[get("/api/money_nodes/{id}")]
pub async fn get_by_id(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::by_id(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

/// post for money nodes should not be used directly, hence debug
#[post("/api/d/money-nodes")]
pub async fn new_debug(
    pool: web::Data<PgPool>,
    web::Path(item): web::Path<NewItem>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::new(&conn, Item::from_input(item)).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

/// patch for money nodes should not be used directly, hence debug
#[patch("/api/d/money_nodes/{id}")]
pub async fn update_by_id_debug(
    pool: web::Data<PgPool>,
    web::Json(item): web::Json<UpdateInputItem>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::update(&conn, UpdateItem::from_input(item), id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

/// delete for money nodes should not be used directly, hence debug
#[delete("/api/d/money_nodes/{id}")]
pub async fn delete_by_id_debug(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::delete(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

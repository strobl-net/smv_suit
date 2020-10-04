use crate::db::transactions as db_items;
use crate::db::PgPool;
use crate::models::transaction::{
    InputUpdateTransaction as UpdateInputItem, NewInputTransaction as NewItem,
    UpdateTransaction as UpdateItem,
};
use actix_web::web::ServiceConfig;
use actix_web::{delete, get, patch, post, web, Error, HttpResponse};
use crate::models::money_node::UpdateMoneyNode;

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

#[get("/api/transactions")]
pub async fn get_all(pool: web::Data<PgPool>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item_list = db_items::all(&conn).unwrap();
    Ok(HttpResponse::Ok().json(item_list))
}

#[get("/api/transactions/{id}")]
pub async fn get_by_id(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::by_id(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[post("/api/transactions")]
pub async fn new(
    pool: web::Data<PgPool>,
    web::Json(item): web::Json<NewItem>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::new(&conn, item).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[patch("/api/transactions/{id}")]
pub async fn update_by_id(
    pool: web::Data<PgPool>,
    web::Json(item): web::Json<UpdateInputItem>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    println!("{:?}", item);
    let conn = pool.get().unwrap();
    let transaction = db_items::update(&conn, UpdateItem::from_input(item.clone()), id).unwrap();
    let money_node = crate::db::money_nodes::update(&conn,UpdateMoneyNode::from_input_transaction(item), transaction.money_node).unwrap();
    Ok(HttpResponse::Ok().json((transaction, money_node)))
}

#[delete("/api/transactions/{id}")]
pub async fn delete_by_id(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::delete(&conn, id);
    Ok(HttpResponse::Ok().json(item))
}

#[get("/api/e/transactions")]
pub async fn get_all_expanded(pool: web::Data<PgPool>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item_list = db_items::all_expanded(&conn);
    Ok(HttpResponse::Ok().json(item_list))
}

#[get("/api/e/transactions/{id}")]
pub async fn get_by_id_expanded(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::by_id_expanded(&conn, id);
    Ok(HttpResponse::Ok().json(item))
}

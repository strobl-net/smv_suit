use crate::db::persons as db_items;
use crate::db::PgPool;
use crate::models::person::{
    InputPerson as InputItem, InputUpdatePerson as UpdateInputItem, NewPerson as Item,
    QueryPerson as QueryItem, UpdatePerson as UpdateItem,
};
use actix_web::web::ServiceConfig;
use actix_web::{delete, get, patch, post, web, Error, HttpRequest, HttpResponse};

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(get_all)
        .service(get_by_id)
        .service(new)
        .service(update_by_id)
        .service(delete_by_id);
}

#[get("/api/persons")]
pub async fn get_all(pool: web::Data<PgPool>, request: HttpRequest) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    if request.query_string().is_empty() {
        let item_list = db_items::all(&conn).unwrap();
        Ok(HttpResponse::Ok().json(item_list))
    } else {
        match serde_qs::from_str::<QueryItem>(&request.query_string()) {
            Ok(query) => {
                let item_list = db_items::by_query(&conn, query).unwrap();
                Ok(HttpResponse::Ok().json(item_list))
            }
            Err(_) => Ok(HttpResponse::InternalServerError().finish()),
        }
    }
}

#[get("/api/persons/{id}")]
pub async fn get_by_id(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::by_id(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[post("/api/persons")]
pub async fn new(
    pool: web::Data<PgPool>,
    web::Json(item): web::Json<InputItem>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::new(&conn, Item::from_input(item)).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[patch("/api/persons/{id}")]
pub async fn update_by_id(
    pool: web::Data<PgPool>,
    web::Json(item): web::Json<UpdateInputItem>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::update(&conn, UpdateItem::from_input(item), id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[delete("/api/persons/{id}")]
pub async fn delete_by_id(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::delete(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

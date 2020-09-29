use crate::db::organisations as db_items;
use crate::db::PgPool;
use crate::models::organisation::{
    InputOrganisation as NewItem, NewOrganisation as Item, InputUpdateOrganisation as UpdateInputItem, QueryOrganisation as QueryItem, UpdateOrganisation as UpdateItem,
};
use actix_web::web::ServiceConfig;
use actix_web::{delete, get, patch, post, web, Error, HttpResponse, HttpRequest};

pub fn endpoints(config: &mut ServiceConfig) {
    config
        .service(get_all)
        .service(get_by_id)
        .service(new)
        .service(update_by_id)
        .service(delete_by_id);
}

#[get("/api/organisations")]
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
            Err(_) => {
                Ok(HttpResponse::InternalServerError().finish())            }
        }
    }
}

#[get("/api/organisations/{id}")]
pub async fn get_by_id(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::by_id(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[post("/api/organisations")]
pub async fn new(
    pool: web::Data<PgPool>,
    web::Json(item): web::Json<NewItem>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::new(&conn, Item::from_input(item)).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[patch("/api/organisations/{id}")]
pub async fn update_by_id(
    pool: web::Data<PgPool>,
    web::Json(item): web::Json<UpdateInputItem>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::update(&conn, UpdateItem::from_input(item), id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

#[delete("/api/organisations/{id}")]
pub async fn delete_by_id(
    pool: web::Data<PgPool>,
    web::Path(id): web::Path<i32>,
) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let item = db_items::delete(&conn, id).unwrap();
    Ok(HttpResponse::Ok().json(item))
}

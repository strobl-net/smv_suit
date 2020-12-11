use actix_web::web::ServiceConfig;
use actix_web::{delete, get, patch, post, web, Error, HttpResponse};
use crate::models::user::{RegisterUser, User};
use crate::db::{auth as db, PgPool};

pub fn endpoints(config: &mut ServiceConfig) {
    config.service(signup);
}

#[post("/api/auth/signup")]
pub async fn signup(web::Json(user): web::Json<RegisterUser>, pool: web::Data<PgPool>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    match db::get_by_username(&user.username, &conn) {
        Ok(_) => {
            Ok(HttpResponse::Conflict().json("Username already exists"))
        }
        Err(_) => {
            unimplemented!()
        }
    }
}
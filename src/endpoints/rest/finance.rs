use actix_web::web::ServiceConfig;
use actix_web::{delete, get, patch, post, web, Error, HttpRequest, HttpResponse};
use crate::db::PgPool;
use crate::db::finance as db;
use crate::db::types::Branch;
use chrono::{Date, NaiveDateTime};
use crate::db::finance::FilterQuery;
use diesel::PgConnection;
use serde::Serialize;

pub fn endpoints(config: &mut ServiceConfig) {
    config.service(money)
        .service(money_defaults);
}

#[get("/api/finance/money")]
pub async fn money(pool: web::Data<PgPool>, request: HttpRequest) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    if request.query_string().is_empty() {
        let sum = db::all(&conn);
        Ok(HttpResponse::Ok().json(sum))
    } else {
        match serde_qs::from_str::<FilterQuery>(&request.query_string()) {
            Ok(query) => {
                println!("{:?}", query);
                let sum = db::by_query(&conn, query);
                Ok(HttpResponse::Ok().json(sum))
            }
            Err(query_err) => {
                println!("{:?}", query_err);
                Ok(HttpResponse::InternalServerError().finish())
            }
        }
    }
}

#[get("/api/finance/money-defaults")]
pub async fn money_defaults(pool: web::Data<PgPool>) -> Result<HttpResponse, Error> {
    let conn = pool.get().unwrap();
    let defaults = DefaultValues::new(&conn);
    Ok(HttpResponse::Ok().json(defaults))
}

#[derive(Serialize)]
struct DefaultValues {
    pub all: i32,
    pub digital_all: i32,
    pub cash_all: i32,
    pub processed_all: i32,
    pub processed_digital: i32,
    pub processed_cash: i32,
    pub not_processed_all: i32,
    pub not_processed_digital: i32,
    pub not_processed_cash: i32,
}

impl DefaultValues {
    fn new(conn: &PgConnection) -> Self {
        let all = db::by_query(&conn, ALL_QUERY);
        let digital_all = db::by_query(&conn, DIGITAL_ALL_QUERY);
        let cash_all = db::by_query(&conn, CASH_ALL_QUERY);
        let processed_all = db::by_query(&conn, PROCESSED_ALL_QUERY);
        let processed_digital = db::by_query(&conn, PROCESSED_DIGITAL_QUERY);
        let processed_cash = db::by_query(&conn, PROCESSED_CASH_QUERY);
        let not_processed_all = db::by_query(&conn, NOT_PROCESSED_ALL_QUERY);
        let not_processed_digital = db::by_query(&conn, NOT_PROCESSED_DIGITAL_QUERY);
        let not_processed_cash = db::by_query(&conn, NOT_PROCESSED_CASH_QUERY);

        Self {
            all,
            digital_all,
            cash_all,
            processed_all,
            processed_digital,
            processed_cash,
            not_processed_all,
            not_processed_digital,
            not_processed_cash
        }
    }
}

const ALL_QUERY: FilterQuery = FilterQuery {
    processed: None,
    branch: None,
    from: None,
    until: None,
};

const DIGITAL_ALL_QUERY: FilterQuery = FilterQuery {
    processed: None,
    branch: Some(Branch::Digital),
    from: None,
    until: None,
};

const CASH_ALL_QUERY: FilterQuery = FilterQuery {
    processed: None,
    branch: Some(Branch::Cash),
    from: None,
    until: None,
};

const PROCESSED_ALL_QUERY: FilterQuery = FilterQuery {
    processed: Some(true),
    branch: None,
    from: None,
    until: None,
};

const PROCESSED_DIGITAL_QUERY: FilterQuery = FilterQuery {
    processed: Some(true),
    branch: Some(Branch::Digital),
    from: None,
    until: None,
};

const PROCESSED_CASH_QUERY: FilterQuery = FilterQuery {
    processed: Some(true),
    branch: Some(Branch::Cash),
    from: None,
    until: None,
};

const NOT_PROCESSED_ALL_QUERY: FilterQuery = FilterQuery {
    processed: Some(false),
    branch: None,
    from: None,
    until: None,
};

const NOT_PROCESSED_DIGITAL_QUERY: FilterQuery = FilterQuery {
    processed: Some(false),
    branch: Some(Branch::Digital),
    from: None,
    until: None,
};


const NOT_PROCESSED_CASH_QUERY: FilterQuery = FilterQuery {
    processed: Some(false),
    branch: Some(Branch::Cash),
    from: None,
    until: None,
};



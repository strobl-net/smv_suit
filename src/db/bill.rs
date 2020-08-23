use diesel::prelude::*;
use crate::{
    models::bill::{NewBill, Bill, UpdateBill},
    schema::{bills, bills::dsl::bills as bills_query},
};

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Bill>> {
    bills_query.order(bills::id.asc()).load::<Bill>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Bill> {
    bills_query.find(id).get_result::<Bill>(conn)
}

pub fn new(conn: &PgConnection, bill: NewBill) -> QueryResult<Bill> {
    diesel::insert_into(bills::table)
        .values(bill)
        .get_result::<Bill>(conn)
}

pub fn update(conn: &PgConnection, bill: UpdateBill, id: i32) -> QueryResult<Bill> {
    diesel::update(bills_query.find(id))
        .set(bill)
        .get_result::<Bill>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> QueryResult<Bill> {
    diesel::delete(bills_query.find(id)).get_result::<Bill>(conn)
}

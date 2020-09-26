use crate::{
    models::bill::{Bill, NewBill, UpdateBill},
    schema::{bills, bills::dsl::bills as bills_query},
};
use diesel::prelude::*;
use crate::models::bill::NewInputBill;

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Bill>> {
    bills_query.order(bills::id.asc()).load::<Bill>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Bill> {
    bills_query.find(id).get_result::<Bill>(conn)
}

pub fn new(conn: &PgConnection, bill: NewInputBill) -> QueryResult<Bill> {
    use crate::db::transactions as other;

    let transaction = other::new(conn, bill.clone().into()).unwrap();
    let mut new_bill = NewBill::from_input(bill.into());
    new_bill.transaction = transaction.id;

    diesel::insert_into(bills::table)
        .values(new_bill)
        .get_result::<Bill>(conn)
}

pub fn new_debug(conn: &PgConnection, bill: NewBill) -> QueryResult<Bill> {
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

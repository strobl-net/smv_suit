use crate::models::bill::{NewInputBill, ExpandedBill};
use crate::{
    models::bill::{Bill, NewBill, UpdateBill},
    schema::{bills, bills::dsl::bills as bills_query},
};
use diesel::prelude::*;
use crate::models::Expandable;

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Bill>> {
    bills_query.order(bills::id.asc()).load::<Bill>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Bill> {
    bills_query.find(id).get_result::<Bill>(conn)
}

pub fn all_expanded(conn: &PgConnection) -> Vec<ExpandedBill> {
    let bills = all(conn).unwrap();
    let mut expanded_bills = Vec::new();
    for bill in bills {
        expanded_bills.push(bill.expand(conn));
    }
    expanded_bills
}

pub fn by_id_expanded(conn: &PgConnection, id: i32) -> ExpandedBill {
    by_id(conn, id).unwrap().expand(conn)
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

pub fn delete(conn: &PgConnection, id: i32) -> Bill {
    let bill = diesel::delete(bills_query.find(id)).get_result::<Bill>(conn).unwrap();
    super::transactions::delete(conn, bill.transaction);
    bill
}

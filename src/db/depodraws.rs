use crate::{
    models::depodraw::{Depodraw, NewDepodraw, UpdateDepodraw},
    schema::{depodraws, depodraws::dsl::depodraws as depodraws_query},
};
use diesel::prelude::*;
use crate::models::depodraw::{NewInputDepodraw, ExpandedDepodraw};
use crate::models::transaction::NewInputTransaction;
use crate::db::types::Branch;
use crate::models::Expandable;

pub fn all(conn: &PgConnection) -> QueryResult<Vec<Depodraw>> {
    depodraws_query
        .order(depodraws::id.asc())
        .load::<Depodraw>(conn)
}

pub fn by_id(conn: &PgConnection, id: i32) -> QueryResult<Depodraw> {
    depodraws_query.find(id).get_result::<Depodraw>(conn)
}

pub fn all_expanded(conn: &PgConnection) -> Vec<ExpandedDepodraw> {
    let depodraws = all(conn).unwrap();
    let expanded = depodraws.iter().map(|depodraw| depodraw.clone().expand(conn)).collect();
    expanded
}

pub fn by_id_expanded(conn: &PgConnection, id: i32) -> ExpandedDepodraw {
    by_id(conn, id).unwrap().expand(conn)
}

pub fn new(conn: &PgConnection, input: NewInputDepodraw) -> QueryResult<Depodraw> {
    let description_up = match input.description.clone() {
        None => Some("DEPODRAW SENDER".to_owned()),
        Some(text) => Some(text + " | DEPODRAW SENDER")
    };
    let description_down = match input.description.clone() {
        None => Some("DEPODRAW RECEIVER".to_owned()),
        Some(text) => Some(text + " | DEPODRAW RECEIVER")
    };
    let transaction_up = NewInputTransaction {
        description: description_up,
        sender: if input.account_up { 1 } else { 2 },
        sender_local: if input.account_up { false } else { true },
        receiver: if input.account_up { 2 } else { 1 },
        receiver_local: if input.account_up { true } else { false },
        branch: if input.account_up { Branch::Digital } else { Branch::Cash },
        change: -input.change,
        currency: input.currency,
        processed: true,
    };
    let transaction_down = NewInputTransaction {
        description: description_down,
        sender: if input.account_up { 1 } else { 2 },
        sender_local: if input.account_up { false } else { true },
        receiver: if input.account_up { 2 } else { 1 },
        receiver_local: if input.account_up { true } else { false },
        branch: if input.account_up { Branch::Cash } else { Branch::Digital },
        change: input.change,
        currency: input.currency,
        processed: true,
    };
    let transaction_up = crate::db::transactions::new(conn, transaction_up).unwrap();
    let transaction_down = crate::db::transactions::new(conn, transaction_down).unwrap();

    let depodraw = NewDepodraw::from_input(input, transaction_up.id, transaction_down.id);

    diesel::insert_into(depodraws::table)
        .values(depodraw)
        .get_result::<Depodraw>(conn)
}

pub fn update(conn: &PgConnection, depodraw: UpdateDepodraw, id: i32) -> QueryResult<Depodraw> {
    diesel::update(depodraws_query.find(id))
        .set(depodraw)
        .get_result::<Depodraw>(conn)
}

pub fn delete(conn: &PgConnection, id: i32) -> Depodraw {
    let depodraw = diesel::delete(depodraws_query.find(id)).get_result::<Depodraw>(conn).unwrap();
    crate::db::transactions::delete(conn, depodraw.transaction_up);
    crate::db::transactions::delete(conn, depodraw.transaction_down);
    depodraw

}

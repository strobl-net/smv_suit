// use crate::schema::bills;
// use chrono::NaiveDateTime;
// use crate::db::types::Currency;
//
// #[derive(Queryable, GraphQLObject, Debug)]
// pub struct Bill {
//     pub id: i32,
//     pub received: NaiveDateTime,
//     pub processed: Option<NaiveDateTime>,
//     pub responsible: Option<i32>, // User ID
//     pub organisation: Option<i32>, // Organisation ID
//     pub change: i64,
//     pub currency: Currency,
//     pub transaction: i32, // Transaction ID
//     pub added: NaiveDateTime,
//     pub changed: Option<NaiveDateTime>,
// }
//
// #[derive(Insertable)]
// #[table_name = "bills"]
// pub struct NewBill<'a> {
//     pub received: NaiveDateTime,
//     pub processed: Option<NaiveDateTime>,
//     pub responsible: Option<i32>, // User ID
//     pub organisation: Option<i32>, // Organisation ID
//     pub change: i64,
//     pub currency: Currency,
//     pub transaction: i32, // Transaction ID
//     pub added: NaiveDateTime,
//     pub changed: Option<NaiveDateTime>,
// }
//
// impl<'a> NewBill<'a> {
//     pub fn from_input(input: &InputBill) -> Self {
//         Self {
//             received: (),
//             processed: None,
//             responsible: None,
//             organisation: None,
//             change: 0,
//             currency: Currency::EUR,
//             transaction: 0,
//             added: chrono::Utc::now().naive_utc(),
//             changed: None,
//         }
//     }
// }
//
// #[derive(GraphQLInputObject)]
// pub struct InputBill {
//
// }
//
// #[derive(AsChangeset, GraphQLInputObject)]
// #[table_name = "bills"]
// pub struct UpdateBill {
//
// }

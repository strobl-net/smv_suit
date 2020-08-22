// use crate::schema::organisation;
// use chrono::NaiveDateTime;
//
// #[derive(Queryable, GraphQLObject, Debug)]
// pub struct  {
//     pub id: i32,
//     pub added: NaiveDateTime,
//     pub changed: Option<NaiveDateTime>,
// }
//
// #[derive(Insertable)]
// #[table_name = "persons"]
// pub struct New<'a> {
//     pub added: NaiveDateTime,
//     pub changed: Option<NaiveDateTime>,
// }
//
// impl<'a> New<'a> {
//     pub fn from_input(input: &Input) -> Self {
//         Self {
//             added: chrono::Utc::now().naive_utc(),
//             changed: None,
//         }
//     }
// }
//
// #[derive(GraphQLInputObject)]
// pub struct Input {
//
// }
//
// #[derive(AsChangeset, GraphQLInputObject)]
// #[table_name = "persons"]
// pub struct Update {
//
// }

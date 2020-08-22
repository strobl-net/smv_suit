use crate::schema::transactions;
use chrono::NaiveDateTime;

#[derive(Queryable, GraphQLObject, Debug)]
pub struct Transaction {
    pub id: i32,
    pub description: Option<String>,
    pub sender: i32, // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32, // TransactionEntity ID
    pub receiver_local: bool,
    pub money_node: i32, // MoneyNode ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable)]
#[table_name = "transactions"]
pub struct NewTransaction {
    pub description: Option<String>,
    pub sender: i32, // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32, // TransactionEntity ID
    pub receiver_local: bool,
    pub money_node: i32, // MoneyNode ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewTransaction {
    pub fn from_input(input: InputTransaction) -> Self {
        Self {
            description: input.description,
            sender: input.sender,
            sender_local: input.sender_local,
            receiver: input.receiver,
            receiver_local: input.receiver_local,
            money_node: input.money_node,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject)]
pub struct InputTransaction {
    pub description: Option<String>,
    pub sender: i32, // TransactionEntity ID
    pub sender_local: bool,
    pub receiver: i32, // TransactionEntity ID
    pub receiver_local: bool,
    pub money_node: i32, // MoneyNode ID
}

#[derive(AsChangeset, GraphQLInputObject)]
#[table_name = "transactions"]
pub struct UpdateTransaction {
    pub description: Option<String>,
    pub sender: Option<i32>, // TransactionEntity ID
    pub sender_local: Option<bool>,
    pub receiver: Option<i32>, // TransactionEntity ID
    pub receiver_local: Option<bool>,
    pub money_node: Option<i32>, // MoneyNode ID
}

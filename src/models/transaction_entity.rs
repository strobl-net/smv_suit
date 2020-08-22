use crate::schema::transaction_entities;
use chrono::NaiveDateTime;

#[derive(Queryable, GraphQLObject, Debug)]
pub struct TransactionEntity {
    pub id: i32,
    pub description: Option<String>,
    pub organisation: Option<i32>, // Organisation ID
    pub person: Option<i32>, // Person ID
    pub iban: Option<String>,
    pub bic: Option<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable)]
#[table_name = "transaction_entities"]
pub struct NewTransactionEntity {
    pub description: Option<String>,
    pub organisation: Option<i32>, // Organisation ID
    pub person: Option<i32>, // Person ID
    pub iban: Option<String>,
    pub bic: Option<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewTransactionEntity {
    pub fn from_input(input: &InputTransactionEntity) -> Self {
        Self {
            description: input.description.clone(),
            organisation: input.organisation,
            person: input.person,
            iban: input.iban.clone(),
            bic: input.bic.clone(),
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject)]
pub struct InputTransactionEntity {
    pub description: Option<String>,
    pub organisation: Option<i32>, // Organisation ID
    pub person: Option<i32>, // Person ID
    pub iban: Option<String>,
    pub bic: Option<String>,
}

#[derive(AsChangeset, GraphQLInputObject)]
#[table_name = "transaction_entities"]
pub struct UpdateTransactionEntity {
    pub description: Option<String>,
    pub organisation: Option<i32>, // Organisation ID
    pub person: Option<i32>, // Person ID
    pub iban: Option<String>,
    pub bic: Option<String>,
}

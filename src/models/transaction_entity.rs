use crate::models::organisation::Organisation;
use crate::models::person::Person;
use crate::models::Expandable;
use crate::schema::transaction_entities;
use chrono::NaiveDateTime;
use diesel::PgConnection;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize)]
pub struct ExpandedTransactionEntity {
    pub id: i32,
    pub description: Option<String>,
    pub organisation: Option<Organisation>,
    pub person: Option<Person>,
    pub iban: Option<String>,
    pub bic: Option<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(GraphQLObject, PartialEq, Queryable, Debug, Serialize, Deserialize)]
pub struct TransactionEntity {
    pub id: i32,
    pub description: Option<String>,
    pub organisation: Option<i32>, // Organisation ID
    pub person: Option<i32>,       // Person ID
    pub iban: Option<String>,
    pub bic: Option<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl Expandable<ExpandedTransactionEntity> for TransactionEntity {
    fn expand(self, conn: &PgConnection) -> ExpandedTransactionEntity {
        let mut expanded_organisation = None;
        let mut expanded_person = None;

        if let Some(organisation_id) = self.organisation {
            expanded_organisation =
                Some(crate::db::organisations::by_id(conn, organisation_id).unwrap());
        }

        if let Some(person_id) = self.person {
            expanded_person = Some(crate::db::persons::by_id(conn, person_id).unwrap());
        }

        ExpandedTransactionEntity {
            id: self.id,
            description: self.description,
            organisation: expanded_organisation,
            person: expanded_person,
            iban: self.iban,
            bic: self.bic,
            added: self.added,
            changed: self.changed,
        }
    }
}

#[derive(Insertable)]
#[table_name = "transaction_entities"]
pub struct NewTransactionEntity {
    pub description: Option<String>,
    pub organisation: Option<i32>, // Organisation ID
    pub person: Option<i32>,       // Person ID
    pub iban: Option<String>,
    pub bic: Option<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewTransactionEntity {
    pub fn from_input(input: InputTransactionEntity) -> Self {
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

#[derive(GraphQLInputObject, Deserialize)]
pub struct InputTransactionEntity {
    pub description: Option<String>,
    pub organisation: Option<i32>, // Organisation ID
    pub person: Option<i32>,       // Person ID
    pub iban: Option<String>,
    pub bic: Option<String>,
}

#[derive(Debug, AsChangeset)]
#[table_name = "transaction_entities"]
pub struct UpdateTransactionEntity {
    pub description: Option<String>,
    pub organisation: Option<i32>, // Organisation ID
    pub person: Option<i32>,       // Person ID
    pub iban: Option<String>,
    pub bic: Option<String>,
    pub changed: Option<NaiveDateTime>,
}

impl UpdateTransactionEntity {
    pub fn from_input(input: InputUpdateTransactionEntity) -> Self {
        Self {
            description: input.description,
            organisation: input.organisation,
            person: input.person,
            iban: input.iban,
            bic: input.bic,
            changed: Some(chrono::Utc::now().naive_utc()),
        }
    }
}

#[derive(GraphQLInputObject, Debug, Deserialize)]
pub struct InputUpdateTransactionEntity {
    pub description: Option<String>,
    pub organisation: Option<i32>,
    pub person: Option<i32>,
    pub iban: Option<String>,
    pub bic: Option<String>,
}

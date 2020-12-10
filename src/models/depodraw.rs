use crate::db::types::Currency;
use crate::models::transaction::ExpandedTransaction;
use crate::models::Expandable;
use crate::schema::depodraws;
use chrono::NaiveDateTime;
use diesel::PgConnection;
use serde::{Deserialize, Serialize};

#[derive(GraphQLObject, Queryable, Debug, Serialize, Deserialize, Clone)]
pub struct Depodraw {
    pub id: i32,
    pub description: Option<String>,
    pub transaction_up: i32,
    // Transaction ID
    pub transaction_down: i32,
    // Transaction ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Debug, Serialize)]
pub struct ExpandedDepodraw {
    pub id: i32,
    pub description: Option<String>,
    pub transaction_up: ExpandedTransaction,
    // Transaction ID
    pub transaction_down: ExpandedTransaction,
    // Transaction ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl Expandable<ExpandedDepodraw> for Depodraw {
    fn expand(self, conn: &PgConnection) -> ExpandedDepodraw {
        let expanded_transaction_up =
            crate::db::transactions::by_id_expanded(conn, self.transaction_up);
        let expanded_transaction_down =
            crate::db::transactions::by_id_expanded(conn, self.transaction_down);

        ExpandedDepodraw {
            id: self.id,
            description: self.description,
            transaction_up: expanded_transaction_up,
            transaction_down: expanded_transaction_down,
            added: self.added,
            changed: self.changed,
        }
    }
}

#[derive(Insertable)]
#[table_name = "depodraws"]
pub struct NewDepodraw {
    pub description: Option<String>,
    pub transaction_up: i32,
    // Transaction ID
    pub transaction_down: i32,
    // Transaction ID
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewDepodraw {
    pub fn from_input(input: NewInputDepodraw, up_id: i32, down_id: i32) -> Self {
        Self {
            description: input.description,
            transaction_up: up_id,
            transaction_down: down_id,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject, Clone, Debug, Deserialize)]
pub struct NewInputDepodraw {
    pub description: Option<String>,
    pub account_up: bool,
    pub change: i32,
    pub currency: Currency,
}

#[derive(Debug, AsChangeset, GraphQLInputObject)]
#[table_name = "depodraws"]
pub struct UpdateDepodraw {
    pub description: Option<String>,
    pub changed: Option<NaiveDateTime>,
}

impl UpdateDepodraw {
    pub fn from_input(input: InputUpdateDepodraw) -> Self {
        Self {
            description: input.description,
            changed: Some(chrono::Utc::now().naive_utc()),
        }
    }
}

#[derive(Debug, Deserialize)]
pub struct InputUpdateDepodraw {
    pub description: Option<String>,
}

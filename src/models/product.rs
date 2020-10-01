use crate::db::types::Currency;
use crate::schema::products;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};
use crate::models::transaction_entity::ExpandedTransactionEntity;
use crate::models::Expandable;
use diesel::PgConnection;

#[derive(Debug, Serialize)]
pub struct ExpandedProduct {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub provider: Option<ExpandedTransactionEntity>,
    pub tags: Option<Vec<String>>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl Expandable<ExpandedProduct> for Product {
    fn expand(self, conn: &PgConnection) -> ExpandedProduct {
        let mut expanded_provider = None;

        if let Some(provider_id) = self.provider {
            expanded_provider =
                Some(crate::db::transaction_entities::by_id_expanded(conn, provider_id));
        }

        ExpandedProduct {
            id: self.id,
            name: self.name,
            description: self.description,
            change: self.change,
            currency: self.currency,
            provider: expanded_provider,
            tags: self.tags,
            added: self.added,
            changed: self.changed
        }
    }
}

#[derive(GraphQLObject, Queryable, Debug, Serialize, Deserialize)]
pub struct Product {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub provider: Option<i32>, // TransactionEntity ID
    pub tags: Option<Vec<String>>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable)]
#[table_name = "products"]
pub struct NewProduct {
    pub name: String,
    pub description: Option<String>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub provider: Option<i32>, // TransactionEntity ID
    pub tags: Option<Vec<String>>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewProduct {
    pub fn from_input(input: InputProduct) -> Self {
        Self {
            name: input.name,
            description: input.description,
            change: input.change,
            currency: input.currency,
            provider: input.provider,
            tags: input.tags,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject, Deserialize)]
pub struct InputProduct {
    pub name: String,
    pub description: Option<String>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub provider: Option<i32>, // Organisation ID
    pub tags: Option<Vec<String>>,
}

#[derive(GraphQLInputObject, AsChangeset, Deserialize)]
#[table_name = "products"]
pub struct UpdateProduct {
    pub name: Option<String>,
    pub description: Option<String>,
    pub change: Option<i32>,
    pub currency: Option<Currency>,
    pub provider: Option<i32>, // Organisation ID
    pub tags: Option<Vec<String>>,
}

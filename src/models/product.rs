use crate::schema::products;
use chrono::NaiveDateTime;
use crate::db::types::Currency;

#[derive(Queryable, GraphQLObject, Debug)]
pub struct Product {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
    pub change: i32,
    pub currency: Currency,
    pub provider: i32, // Organisation ID
    pub tags: Vec<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable)]
#[table_name = "products"]
pub struct NewProduct {
    pub name: String,
    pub description: Option<String>,
    pub change: i32,
    pub currency: Currency,
    pub provider: i32, // Organisation ID
    pub tags: Vec<String>,
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

#[derive(GraphQLInputObject)]
pub struct InputProduct {
    pub name: String,
    pub description: Option<String>,
    pub change: i32,
    pub currency: Currency,
    pub provider: i32,
    pub tags: Vec<String>,
}

#[derive(AsChangeset, GraphQLInputObject)]
#[table_name = "products"]
pub struct UpdateProduct {
    pub name: String,
    pub description: Option<String>,
    pub change: i32,
    pub currency: Currency,
    pub tags: Vec<String>,
}

use crate::schema::organisations;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};

#[derive(GraphQLObject, Queryable, Debug, Serialize, Deserialize)]
pub struct Organisation {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
    pub site: Option<String>,
    pub location: Option<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

#[derive(Insertable)]
#[table_name = "organisations"]
pub struct NewOrganisation {
    pub name: String,
    pub description: Option<String>,
    pub site: Option<String>,
    pub location: Option<String>,
    pub added: NaiveDateTime,
    pub changed: Option<NaiveDateTime>,
}

impl NewOrganisation {
    pub fn from_input(input: InputOrganisation) -> Self {
        Self {
            name: input.name,
            description: input.description,
            site: input.site,
            location: input.location,
            added: chrono::Utc::now().naive_utc(),
            changed: None,
        }
    }
}

#[derive(GraphQLInputObject, Deserialize)]
pub struct InputOrganisation {
    pub name: String,
    pub description: Option<String>,
    pub site: Option<String>,
    pub location: Option<String>,
}

#[derive(GraphQLInputObject, AsChangeset, Deserialize)]
#[table_name = "organisations"]
pub struct UpdateOrganisation {
    pub name: Option<String>,
    pub description: Option<String>,
    pub site: Option<String>,
    pub location: Option<String>,
}

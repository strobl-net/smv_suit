use crate::schema::organisations;
use chrono::NaiveDateTime;
use serde::{Deserialize, Serialize};

#[derive(GraphQLObject, PartialEq, Queryable, Debug, Serialize, Deserialize)]
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

#[derive(Debug, AsChangeset)]
#[table_name = "organisations"]
pub struct UpdateOrganisation {
    pub name: Option<String>,
    pub description: Option<String>,
    pub site: Option<String>,
    pub location: Option<String>,
    pub changed: Option<NaiveDateTime>,
}

impl UpdateOrganisation {
    pub fn from_input(input: InputUpdateOrganisation) -> Self {
        Self {
            name: input.name,
            description: input.description,
            site: input.site,
            location: input.location,
            changed: Some(chrono::Utc::now().naive_utc()),
        }
    }
}

#[derive(GraphQLInputObject, Debug, Deserialize)]
pub struct InputUpdateOrganisation {
    pub name: Option<String>,
    pub description: Option<String>,
    pub site: Option<String>,
    pub location: Option<String>,
}

#[derive(Queryable, Debug, Deserialize)]
pub struct QueryOrganisation {
    pub name: Option<String>,
    pub description: Option<String>,
    pub location: Option<String>
}
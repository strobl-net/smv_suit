//! GraphQL Backend Module
pub mod person;

use crate::db::PgPool;
use crate::models::person::{InputPerson, NewPerson, Person, UpdatePerson};
use juniper::{FieldResult, RootNode};
use person::{PersonMutation, PersonQuery};

// Context / relevant data for GraphQL to operate
pub struct Context {
    pub pool: PgPool,
}

impl juniper::Context for Context {}

/// Query holds all queryable objects and operations
/// e.g. getAll, getByID
/// e.g. Model
pub struct Query;

/// Mutation holds all data changing objects and operations
/// e.g. newModel, updateModel, removeModel
/// e.g. InputModel, UpdateModel
pub struct Mutation;

// new schema
pub type Schema = RootNode<'static, Query, Mutation>;

// small helper function to create a new schema
pub fn create_schema() -> Schema {
    Schema::new(Query, Mutation)
}

#[juniper::object(Context = Context)]
impl Query {
    #[graphql(name = "persons")]
    pub fn persons_all(ctx: &Context) -> FieldResult<Vec<Person>> {
        PersonQuery::all(ctx)
    }

    #[graphql(name = "personById")]
    pub fn persons_by_id(ctx: &Context, id: i32) -> FieldResult<Option<Person>> {
        PersonQuery::by_id(ctx, id)
    }
}

#[juniper::object(Context = Context)]
impl Mutation {
    #[graphql(name = "personNew")]
    pub fn persons_new(ctx: &Context, person: InputPerson) -> FieldResult<Person> {
        let person = NewPerson::from_input(&person);
        PersonMutation::new(ctx, person)
    }

    #[graphql(name = "personUpdate")]
    pub fn persons_update(ctx: &Context, person: UpdatePerson, id: i32) -> FieldResult<Person> {
        PersonMutation::update(ctx, person, id)
    }

    #[graphql(name = "personDelete")]
    pub fn persons_delete(ctx: &Context, id: i32) -> FieldResult<Person> {
        PersonMutation::delete(ctx, id)
    }
}

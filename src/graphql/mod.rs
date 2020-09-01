//! GraphQL Backend Module

pub mod bill;
pub mod depodraw;
pub mod money_node;
pub mod organisation;
pub mod person;
pub mod product;
pub mod statement_of_account;
pub mod transaction;
pub mod transaction_entity;

use crate::db::PgPool;
use crate::models::person::{InputPerson, NewPerson, Person, UpdatePerson};
use juniper::{FieldResult, RootNode};
use person::{PersonMutation, PersonQuery};
use crate::graphql::bill::BillQuery;
use crate::models::bill::Bill;
use crate::models::depodraw::Depodraw;
use crate::graphql::depodraw::DepodrawQuery;
use crate::graphql::money_node::MoneyNodeQuery;
use crate::models::money_node::MoneyNode;
use crate::graphql::organisation::OrganisationQuery;
use crate::models::organisation::Organisation;
use crate::models::product::Product;
use crate::models::statement_of_account::StatementOfAccount;
use crate::models::transaction::Transaction;
use crate::models::transaction_entity::TransactionEntity;
use crate::graphql::product::ProductQuery;
use crate::graphql::statement_of_account::StatementOfAccountQuery;
use crate::graphql::transaction::TransactionQuery;
use crate::graphql::transaction_entity::TransactionEntityQuery;

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

    #[graphql(name = "bills")]
    pub fn bills_all(ctx: &Context) -> FieldResult<Vec<Bill>> {
        BillQuery::all(ctx)
    }

    #[graphql(name = "billById")]
    pub fn bills_by_id(ctx: &Context, id: i32) -> FieldResult<Option<Bill>> {
        BillQuery::by_id(ctx, id)
    }

    #[graphql(name = "depodraws")]
    pub fn depodraws_all(ctx: &Context) -> FieldResult<Vec<Depodraw>> {
        DepodrawQuery::all(ctx)
    }

    #[graphql(name = "depodrawsById")]
    pub fn depodraws_by_id(ctx: &Context, id: i32) -> FieldResult<Option<Depodraw>> {
        DepodrawQuery::by_id(ctx, id)
    }

    #[graphql(name = "moneyNodes")]
    pub fn money_nodes_all(ctx: &Context) -> FieldResult<Vec<MoneyNode>> {
        MoneyNodeQuery::all(ctx)
    }

    #[graphql(name = "moneyNodesById")]
    pub fn money_nodes_by_id(ctx: &Context, id: i32) -> FieldResult<Option<MoneyNode>> {
        MoneyNodeQuery::by_id(ctx, id)
    }

    #[graphql(name = "organisations")]
    pub fn organisations_all(ctx: &Context) -> FieldResult<Vec<Organisation>> {
        OrganisationQuery::all(ctx)
    }

    #[graphql(name = "organisationsById")]
    pub fn organisations_by_id(ctx: &Context, id: i32) -> FieldResult<Option<Organisation>> {
        OrganisationQuery::by_id(ctx, id)
    }

    #[graphql(name = "persons")]
    pub fn persons_all(ctx: &Context) -> FieldResult<Vec<Person>> {
        PersonQuery::all(ctx)
    }

    #[graphql(name = "personById")]
    pub fn persons_by_id(ctx: &Context, id: i32) -> FieldResult<Option<Person>> {
        PersonQuery::by_id(ctx, id)
    }

    #[graphql(name = "products")]
    pub fn products_all(ctx: &Context) -> FieldResult<Vec<Product>> {
        ProductQuery::all(ctx)
    }

    #[graphql(name = "productsById")]
    pub fn products_by_id(ctx: &Context, id: i32) -> FieldResult<Option<Product>> {
        ProductQuery::by_id(ctx, id)
    }

    #[graphql(name = "statementOfAccounts")]
    pub fn statement_of_accounts_all(ctx: &Context) -> FieldResult<Vec<StatementOfAccount>> {
        StatementOfAccountQuery::all(ctx)
    }

    #[graphql(name = "statementOfAccountsById")]
    pub fn statement_of_accounts_by_id(ctx: &Context, id: i32) -> FieldResult<Option<StatementOfAccount>> {
        StatementOfAccountQuery::by_id(ctx, id)
    }

    #[graphql(name = "transactions")]
    pub fn transactions_all(ctx: &Context) -> FieldResult<Vec<Transaction>> {
        TransactionQuery::all(ctx)
    }

    #[graphql(name = "transactionsById")]
    pub fn transactions_by_id(ctx: &Context, id: i32) -> FieldResult<Option<Transaction>> {
        TransactionQuery::by_id(ctx, id)
    }

    #[graphql(name = "transactionsEntities")]
    pub fn transaction_entities(ctx: &Context) -> FieldResult<Vec<TransactionEntity>> {
        TransactionEntityQuery::all(ctx)
    }

    #[graphql(name = "transactionEntitiesById")]
    pub fn transaction_entities_by_id(ctx: &Context, id: i32) -> FieldResult<Option<TransactionEntity>> {
        TransactionEntityQuery::by_id(ctx, id)
    }
}

#[juniper::object(Context = Context)]
impl Mutation {
    #[graphql(name = "personNew")]
    pub fn persons_new(ctx: &Context, person: InputPerson) -> FieldResult<Person> {
        let person = NewPerson::from_input(person);
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

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
use crate::graphql::bill::{BillMutation, BillQuery};
use crate::graphql::depodraw::{DepodrawMutation, DepodrawQuery};
use crate::graphql::money_node::{MoneyNodeMutation, MoneyNodeQuery};
use crate::graphql::organisation::{OrganisationMutation, OrganisationQuery};
use crate::graphql::product::{ProductMutation, ProductQuery};
use crate::graphql::statement_of_account::{StatementOfAccountMutation, StatementOfAccountQuery};
use crate::graphql::transaction::{TransactionMutation, TransactionQuery};
use crate::graphql::transaction_entity::{TransactionEntityMutation, TransactionEntityQuery};
use crate::models::bill::{Bill, InputBill, NewBill, UpdateBill};
use crate::models::depodraw::{Depodraw, InputDepodraw, NewDepodraw, UpdateDepodraw};
use crate::models::money_node::{InputMoneyNode, MoneyNode, NewMoneyNode, UpdateMoneyNode};
use crate::models::organisation::{
    InputOrganisation, NewOrganisation, Organisation, UpdateOrganisation,
};
use crate::models::person::{InputPerson, NewPerson, Person, UpdatePerson};
use crate::models::product::{InputProduct, NewProduct, Product, UpdateProduct};
use crate::models::statement_of_account::{
    InputStatementOfAccount, NewStatementOfAccount, StatementOfAccount, UpdateStatementOfAccount,
};
use crate::models::transaction::{
    InputTransaction, NewTransaction, Transaction, UpdateTransaction,
};
use crate::models::transaction_entity::{
    InputTransactionEntity, NewTransactionEntity, TransactionEntity, UpdateTransactionEntity,
};
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
    pub fn statement_of_accounts_by_id(
        ctx: &Context,
        id: i32,
    ) -> FieldResult<Option<StatementOfAccount>> {
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
    pub fn transaction_entities_by_id(
        ctx: &Context,
        id: i32,
    ) -> FieldResult<Option<TransactionEntity>> {
        TransactionEntityQuery::by_id(ctx, id)
    }
}

#[juniper::object(Context = Context)]
impl Mutation {
    #[graphql(name = "billNew")]
    pub fn bills_new(ctx: &Context, bill: InputBill) -> FieldResult<Bill> {
        let bill = NewBill::from_input(bill);
        BillMutation::new(ctx, bill)
    }

    #[graphql(name = "billUpdate")]
    pub fn bills_update(ctx: &Context, bill: UpdateBill, id: i32) -> FieldResult<Bill> {
        BillMutation::update(ctx, bill, id)
    }

    #[graphql(name = "billDelete")]
    pub fn bills_delete(ctx: &Context, id: i32) -> FieldResult<Bill> {
        BillMutation::delete(ctx, id)
    }

    #[graphql(name = "depodrawNew")]
    pub fn depodraws_new(ctx: &Context, depodraw: InputDepodraw) -> FieldResult<Depodraw> {
        let depodraw = NewDepodraw::from_input(depodraw);
        DepodrawMutation::new(ctx, depodraw)
    }

    #[graphql(name = "depodrawUpdate")]
    pub fn depodraws_update(
        ctx: &Context,
        depodraw: UpdateDepodraw,
        id: i32,
    ) -> FieldResult<Depodraw> {
        DepodrawMutation::update(ctx, depodraw, id)
    }

    #[graphql(name = "depodrawDelete")]
    pub fn depodraws_delete(ctx: &Context, id: i32) -> FieldResult<Depodraw> {
        DepodrawMutation::delete(ctx, id)
    }

    #[graphql(name = "moneyNodeNew")]
    pub fn money_nodes_new(ctx: &Context, money_node: InputMoneyNode) -> FieldResult<MoneyNode> {
        let money_node = NewMoneyNode::from_input(money_node);
        MoneyNodeMutation::new(ctx, money_node)
    }

    #[graphql(name = "moneyNodeUpdate")]
    pub fn money_nodes_update(
        ctx: &Context,
        money_node: UpdateMoneyNode,
        id: i32,
    ) -> FieldResult<MoneyNode> {
        MoneyNodeMutation::update(ctx, money_node, id)
    }

    #[graphql(name = "moneyNodeDelete")]
    pub fn money_nodes_delete(ctx: &Context, id: i32) -> FieldResult<MoneyNode> {
        MoneyNodeMutation::delete(ctx, id)
    }

    #[graphql(name = "organisationNew")]
    pub fn organisations_new(
        ctx: &Context,
        organisation: InputOrganisation,
    ) -> FieldResult<Organisation> {
        let organisation = NewOrganisation::from_input(organisation);
        OrganisationMutation::new(ctx, organisation)
    }

    #[graphql(name = "organisationUpdate")]
    pub fn organisations_update(
        ctx: &Context,
        organisation: UpdateOrganisation,
        id: i32,
    ) -> FieldResult<Organisation> {
        OrganisationMutation::update(ctx, organisation, id)
    }

    #[graphql(name = "organisationDelete")]
    pub fn organisations_delete(ctx: &Context, id: i32) -> FieldResult<Organisation> {
        OrganisationMutation::delete(ctx, id)
    }

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

    #[graphql(name = "productNew")]
    pub fn products_new(ctx: &Context, product: InputProduct) -> FieldResult<Product> {
        let product = NewProduct::from_input(product);
        ProductMutation::new(ctx, product)
    }

    #[graphql(name = "productUpdate")]
    pub fn products_update(ctx: &Context, product: UpdateProduct, id: i32) -> FieldResult<Product> {
        ProductMutation::update(ctx, product, id)
    }

    #[graphql(name = "productDelete")]
    pub fn products_delete(ctx: &Context, id: i32) -> FieldResult<Product> {
        ProductMutation::delete(ctx, id)
    }

    #[graphql(name = "statementOfAccountNew")]
    pub fn statement_of_accounts_new(
        ctx: &Context,
        statement_of_account: InputStatementOfAccount,
    ) -> FieldResult<StatementOfAccount> {
        let statement_of_account = NewStatementOfAccount::from_input(statement_of_account);
        StatementOfAccountMutation::new(ctx, statement_of_account)
    }

    #[graphql(name = "statementOfAccountUpdate")]
    pub fn statement_of_accounts_update(
        ctx: &Context,
        statement_of_account: UpdateStatementOfAccount,
        id: i32,
    ) -> FieldResult<StatementOfAccount> {
        StatementOfAccountMutation::update(ctx, statement_of_account, id)
    }

    #[graphql(name = "statementOfAccountDelete")]
    pub fn statement_of_accounts_delete(ctx: &Context, id: i32) -> FieldResult<StatementOfAccount> {
        StatementOfAccountMutation::delete(ctx, id)
    }

    #[graphql(name = "transactionNew")]
    pub fn transactions_new(
        ctx: &Context,
        transaction: InputTransaction,
    ) -> FieldResult<Transaction> {
        let transaction = NewTransaction::from_input(transaction);
        TransactionMutation::new(ctx, transaction)
    }

    #[graphql(name = "transactionUpdate")]
    pub fn transactions_update(
        ctx: &Context,
        transaction: UpdateTransaction,
        id: i32,
    ) -> FieldResult<Transaction> {
        TransactionMutation::update(ctx, transaction, id)
    }

    #[graphql(name = "transactionDelete")]
    pub fn transactions_delete(ctx: &Context, id: i32) -> FieldResult<Transaction> {
        TransactionMutation::delete(ctx, id)
    }

    #[graphql(name = "transactionEntityNew")]
    pub fn transaction_entities_new(
        ctx: &Context,
        transaction_entity: InputTransactionEntity,
    ) -> FieldResult<TransactionEntity> {
        let transaction_entity = NewTransactionEntity::from_input(transaction_entity);
        TransactionEntityMutation::new(ctx, transaction_entity)
    }

    #[graphql(name = "transactionEntityUpdate")]
    pub fn transaction_entities_update(
        ctx: &Context,
        transaction_entity: UpdateTransactionEntity,
        id: i32,
    ) -> FieldResult<TransactionEntity> {
        TransactionEntityMutation::update(ctx, transaction_entity, id)
    }

    #[graphql(name = "transactionEntityDelete")]
    pub fn transaction_entities_delete(ctx: &Context, id: i32) -> FieldResult<TransactionEntity> {
        TransactionEntityMutation::delete(ctx, id)
    }
}

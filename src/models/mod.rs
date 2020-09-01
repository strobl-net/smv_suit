//! This module contains all the models
//! every model has multiple versions of it
//!
//! InputModel -> Model from the GraphQL API
//! NewModel -> InputModel with timestamp, consumed by diesel
//! UpdateModel -> Similar to InputModel but with Option<T> only
//! Model -> Model with all data

pub mod bill;
pub mod depodraw;
pub mod money_node;
pub mod organisation;
pub mod person;
pub mod product;
pub mod statement_of_account;
pub mod transaction;
pub mod transaction_entity;

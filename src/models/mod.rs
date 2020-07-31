//! This module contains all the models
//! every model has multiple versions of it
//!
//! InputModel -> Model from the GraphQL API
//! NewModel -> InputModel with timestamp, consumed by diesel
//! UpdateModel -> Similar to InputModel but with Option<T> only
//! Model -> Model with all data

pub mod person;

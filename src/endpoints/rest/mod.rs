use actix_web::web::ServiceConfig;

mod persons;
mod organisations;
mod transaction_entities;
mod products;
mod money_nodes;
mod transactions;
mod bills;
mod depodraws;
mod statement_of_accounts;

pub fn rest_endpoints(config: &mut ServiceConfig) {
    persons::person_rest_endpoints(config);
}
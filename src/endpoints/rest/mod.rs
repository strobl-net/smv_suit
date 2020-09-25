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
    persons::endpoints(config);
    organisations::endpoints(config);
    transaction_entities::endpoints(config);
    products::endpoints(config);
    money_nodes::endpoints(config);
    transactions::endpoints(config);
    bills::endpoints(config);
    depodraws::endpoints(config);
    statement_of_accounts::endpoints(config);
}
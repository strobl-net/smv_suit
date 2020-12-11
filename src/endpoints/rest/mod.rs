use actix_web::web::ServiceConfig;

mod auth;
mod bills;
mod depodraws;
mod money_nodes;
mod organisations;
mod persons;
mod products;
mod statement_of_accounts;
mod transaction_entities;
mod transactions;
mod finance;

pub fn endpoints(config: &mut ServiceConfig) {
    auth::endpoints(config);
    persons::endpoints(config);
    organisations::endpoints(config);
    transaction_entities::endpoints(config);
    products::endpoints(config);
    money_nodes::endpoints(config);
    transactions::endpoints(config);
    bills::endpoints(config);
    depodraws::endpoints(config);
    statement_of_accounts::endpoints(config);
    finance::endpoints(config);
}

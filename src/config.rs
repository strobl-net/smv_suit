use std::env::Args;

// DB_ADDRESS=<ADDRESS>
#[derive(Debug, Clone)]
pub struct Config {
    db_address: String,
    db_user: String,
    db_password: String,
}

impl Config {
    //TODO: impl optional arguments!
    pub fn new(_args: Args) -> Self {
        let env_values: Vec<String> = read_env();
        Self {
            db_address: env_values.get(0).unwrap().to_string(),
            db_user: env_values.get(1).unwrap().to_string(),
            db_password: env_values.get(2).unwrap().to_string(),
        }
    }
}
// ENV values or default values if ENV Value undefined
fn read_env() -> Vec<String> {
    let mut values: Vec<String> = Vec::new();
    values.push(std::env::var("DB_ADDRESS").unwrap_or_else(|_| "127.0.0.1:5432".to_string()));
    values.push(std::env::var("DB_USER").unwrap_or_else(|_| "admin".to_string()));
    values.push(std::env::var("DB_PASSWORD").unwrap_or_else(|_| "admin".to_string()));
    values
}

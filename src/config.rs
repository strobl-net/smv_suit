use std::{env::Args, fmt};

// DB_ADDRESS=<ADDRESS>
#[derive(Debug, Clone)]
pub struct Config {
    pub db_address: String,
    pub db_link: String,
    pub pool_limit: Option<u32>,
    pub server_address: String,
}

impl Config {
    //TODO: impl optional arguments!
    pub fn new(_args: Args) -> Self {
        let env_values: Vec<String> = read_env();
        let pool_limit_num: u32 = env_values
            .get(2)
            .unwrap_or(&"0".to_string())
            .parse()
            .unwrap();
        let mut pool_limit: Option<u32> = None;
        if pool_limit_num != 0 {
            pool_limit = Some(pool_limit_num);
        }

        Self {
            db_address: env_values.get(0).unwrap().to_string(),
            db_link: env_values.get(1).unwrap().to_string(),
            pool_limit,
            server_address: env_values.get(3).unwrap().to_string(),
        }
    }
}
impl fmt::Display for Config {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "DB_LINK: {} \n \
                 SERVER_ADDRESS: {} \n \
                 POOL_LIMIT: {:?} \n ",
            self.db_link, self.server_address, self.pool_limit
        )
    }
}
// ENV values or default values if ENV Value undefined
fn read_env() -> Vec<String> {
    let mut values: Vec<String> = Vec::new();
    // read all env variables
    let db_ip = std::env::var("DB_ADDRESS").unwrap_or_else(|_| "127.0.0.1".to_string());
    let db_port = std::env::var("DB_PORT").unwrap_or_else(|_| "5432".to_string());
    let db_name = std::env::var("DB_NAME").unwrap_or_else(|_| "smv".to_string());
    let db_user = std::env::var("DB_USER").unwrap_or_else(|_| "admin".to_string());
    let db_password = std::env::var("DB_PASSWORD").unwrap_or_else(|_| "admin".to_string());
    let pool_limit = std::env::var("POOL_LIMIT").unwrap_or_else(|_| "0".to_string());
    let server_ip = std::env::var("SERVER_IP").unwrap_or_else(|_| "127.0.0.1".to_string());
    let server_port = std::env::var("SERVER_PORT").unwrap_or_else(|_| "8080".to_string());

    // format
    let db_address = format!("{}:{}", db_ip, db_port);
    let db_link = format!(
        "postgres://{}:{}@{}:{}/{}",
        db_user, db_password, db_ip, db_port, db_name
    );
    let server_address = format!("{}:{}", server_ip, server_port);

    values.push(db_address);
    values.push(db_link);
    values.push(pool_limit);
    values.push(server_address);
    values
}

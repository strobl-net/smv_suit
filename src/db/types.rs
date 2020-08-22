use diesel::deserialize::{self, FromSql, FromSqlRow};
use diesel::serialize::{self, IsNull, Output, ToSql};
use diesel::sql_types::HasSqlType;
use diesel::pg::{Pg, PgValue};
use std::io::Write;

pub mod exports {
    pub use super::CurrencyType as Currency;
    pub use super::BranchType as Branch;
}

#[derive(SqlType, Debug)]
#[postgres(type_name = "Currency")]
pub struct CurrencyType;

#[derive(SqlType, Debug)]
#[postgres(type_name = "Branch")]
pub struct BranchType;

#[derive(Debug, AsExpression, FromSqlRow)]
#[sql_type = "CurrencyType"]
pub enum Currency {
    EUR,
    USD,
}

#[derive(Debug, AsExpression, FromSqlRow)]
#[sql_type = "BranchType"]
pub enum Branch {
    Digital,
    Cash,
}

impl ToSql<CurrencyType, Pg> for Currency {
    fn to_sql<W: Write>(&self, out: &mut Output<W, Pg>) -> serialize::Result {
        match *self {
            Currency::EUR => out.write_all(b"eur")?,
            Currency::USD => out.write_all(b"usd")?,
        }
        Ok(IsNull::No)
    }
}

impl FromSql<CurrencyType, Pg> for Currency {
    fn from_sql(bytes: PgValue) -> deserialize::Result<Self> {
        match bytes.as_bytes() {
            b"eur" => Ok(Currency::EUR),
            b"usd" => Ok(Currency::USD),
            _ => Err("Unrecognized enum variant".into())
        }
    }
}


impl ToSql<BranchType, Pg> for Branch {
    fn to_sql<W: Write>(&self, out: &mut Output<W, Pg>) -> serialize::Result {
        match *self {
            Branch::Digital => out.write_all(b"digital")?,
            Branch::Cash => out.write_all(b"cash")?,
        }
        Ok(IsNull::No)
    }
}

impl FromSql<BranchType, Pg> for Branch {
    fn from_sql(bytes: PgValue) -> deserialize::Result<Self> {
        match bytes.as_bytes() {
            b"digital" => Ok(Branch::Digital),
            b"cash" => Ok(Branch::Cash),
            _ => Err("Unrecognized enum variant".into())
        }
    }
}
#![allow(unused)]

table! {
    use diesel::sql_types::*;
    use crate::db::types::exports::*;

    bills (id) {
        id -> Int4,
        received -> Timestamp,
        processed -> Nullable<Timestamp>,
        products -> Nullable<Array<Int4>>,
        responsible -> Nullable<Int4>,
        transaction -> Int4,
        added -> Timestamp,
        changed -> Nullable<Timestamp>,
    }
}

table! {
    use diesel::sql_types::*;
    use crate::db::types::exports::*;

    depodraws (id) {
        id -> Int4,
        description -> Nullable<Text>,
        transaction_up -> Int4,
        transaction_down -> Int4,
        added -> Timestamp,
        changed -> Nullable<Timestamp>,
    }
}

table! {
    use diesel::sql_types::*;
    use crate::db::types::exports::*;

    money_nodes (id) {
        id -> Int4,
        branch -> Branch,
        change -> Int4,
        currency -> Currency,
        processed -> Bool,
        added -> Timestamp,
        changed -> Nullable<Timestamp>,
    }
}

table! {
    use diesel::sql_types::*;
    use crate::db::types::exports::*;

    organisations (id) {
        id -> Int4,
        name -> Text,
        description -> Nullable<Text>,
        site -> Nullable<Text>,
        location -> Nullable<Text>,
        added -> Timestamp,
        changed -> Nullable<Timestamp>,
    }
}

table! {
    use diesel::sql_types::*;
    use crate::db::types::exports::*;

    persons (id) {
        id -> Int4,
        name -> Text,
        email -> Nullable<Text>,
        phone -> Nullable<Varchar>,
        tags -> Array<Text>,
        added -> Timestamp,
        changed -> Nullable<Timestamp>,
    }
}

table! {
    use diesel::sql_types::*;
    use crate::db::types::exports::*;

    products (id) {
        id -> Int4,
        name -> Text,
        description -> Nullable<Text>,
        change -> Nullable<Int4>,
        currency -> Nullable<Currency>,
        provider -> Nullable<Int4>,
        tags -> Nullable<Array<Text>>,
        added -> Timestamp,
        changed -> Nullable<Timestamp>,
    }
}

table! {
    use diesel::sql_types::*;
    use crate::db::types::exports::*;

    statement_of_accounts (id) {
        id -> Int4,
        description -> Nullable<Text>,
        starting -> Timestamp,
        ending -> Timestamp,
        added -> Timestamp,
        changed -> Nullable<Timestamp>,
    }
}

table! {
    use diesel::sql_types::*;
    use crate::db::types::exports::*;

    transaction_entities (id) {
        id -> Int4,
        description -> Nullable<Text>,
        organisation -> Nullable<Int4>,
        person -> Nullable<Int4>,
        iban -> Nullable<Varchar>,
        bic -> Nullable<Varchar>,
        added -> Timestamp,
        changed -> Nullable<Timestamp>,
    }
}

table! {
    use diesel::sql_types::*;
    use crate::db::types::exports::*;

    transactions (id) {
        id -> Int4,
        description -> Nullable<Text>,
        sender -> Int4,
        sender_local -> Bool,
        receiver -> Int4,
        receiver_local -> Bool,
        money_node -> Int4,
        added -> Timestamp,
        changed -> Nullable<Timestamp>,
    }
}

joinable!(bills -> persons (responsible));
joinable!(bills -> transactions (transaction));
joinable!(products -> transaction_entities (provider));
joinable!(transaction_entities -> organisations (organisation));
joinable!(transaction_entities -> persons (person));
joinable!(transactions -> money_nodes (money_node));

allow_tables_to_appear_in_same_query!(
    bills,
    depodraws,
    money_nodes,
    organisations,
    persons,
    products,
    statement_of_accounts,
    transaction_entities,
    transactions,
);

table! {
    persons (id) {
        id -> Int4,
        name -> Text,
        email -> Nullable<Text>,
        phone -> Nullable<Varchar>,
        tags -> Array<Text>,
        date_added -> Timestamp,
    }
}

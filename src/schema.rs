table! {
    persons (id) {
        id -> Int4,
        date_added -> Timestamp,
        name -> Text,
        email -> Nullable<Text>,
        phone -> Nullable<Varchar>,
        tags -> Array<Text>,
    }
}

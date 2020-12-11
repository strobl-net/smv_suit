/// TechItem is the backend representation of a product used for technical purposes.
/// products like tape don't fall into this category and should be treated as normal products and
/// may be tagged with a `tech` tag
pub struct TechItem {
    /// internal id
    pub id: i32,
    /// product name
    pub name: String,
    /// user definable description of the product
    pub description: Option<String>,
    /// details in Json format (ex. power consumption, lED-Type, seller, price)
    pub details: Option<String>,
    /// user definable categories (ex. light, interior, exterior, cable)
    pub categories: Option<Vec<String>>,
    /// user definable groups (ex. light1, christmas)
    pub group: Option<String>,
    /// current place (ex. main storage, secondary storage, stage, auditorium)
    pub current_place: Option<String>,
    /// whether item is "permanently installed" or not
    pub installed: bool,
}
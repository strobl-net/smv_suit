class Organisation {
  final int id;
  String name;
  String description; // OPTIONAL
  String site; // OPTIONAL
  String location; // OPTIONAL
  DateTime added;
  DateTime changed; // OPTIONAL

  Organisation(this.id, this.name, this.description, this.site, this.location, this.added, this.changed);
}
class Person {
  final int id;
  String name;
  String email; // OPTIONAL
  String phone; // OPTIONAL
  List<String> tags;
  DateTime added;
  DateTime changed; // OPTIONAL

  Person(this.id, this.name, this.email, this.phone, this.tags, this.added, this.changed);
}
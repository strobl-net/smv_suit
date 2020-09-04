class StatementOfAccount {
  final int id;
  String description; // OPTIONAL
  DateTime starting;
  DateTime ending;
  DateTime added;
  DateTime changed; // OPTIONAL

  StatementOfAccount(this.id, this.description, this.starting, this.ending, this.added, this.changed);
}
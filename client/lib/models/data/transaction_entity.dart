import 'package:client/models/data/organisation.dart';

import 'person.dart';

class TransactionEntity {
  final int id;
  final String description;
  final Organisation organisation;
  final Person person;
  final String iban;
  final String bic;
  final DateTime added;
  final DateTime changed;

  TransactionEntity({this.id, this.description, this.organisation, this.person, this.iban, this.bic, this.added, this.changed});
}
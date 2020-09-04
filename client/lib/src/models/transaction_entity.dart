import 'organisation.dart';
import 'person.dart';

class TransactionEntity {
  final int id;
  String description; // OPTIONAL
  Organisation organisation; // OPTIONAL
  Person person; // OPTIONAL
  String iban; // OPTIONAL
  String bic; // OPTIONAL
  DateTime added;
  DateTime changed; // OPTIONAL

  TransactionEntity(this.id, this.description, this.person, this.iban, this.bic, this.added, this.changed);
}
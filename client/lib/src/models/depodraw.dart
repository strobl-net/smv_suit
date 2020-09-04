import 'package:client/src/models/transaction.dart';

class Depodraw {
  final int id;
  String description; // OPTIONAL
  Transaction transaction_up;
  Transaction transaction_down;
  DateTime added;
  DateTime changed; // OPTIONAL

  Depodraw(this.id, this.description, this.transaction_up, this.transaction_down, this.added, this.changed);
}
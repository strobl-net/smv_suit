import 'package:client/models/data/transaction.dart';

class DepoDraw {
  final int id;
  final String description;
  final Transaction transaction_up;
  final Transaction transaction_down;
  final DateTime added;
  final DateTime changed;

  DepoDraw({this.id, this.description, this.transaction_up, this.transaction_down, this.added, this.changed});
}
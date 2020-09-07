import 'package:client/models/data/types.dart';

class MoneyNode {
  final int id;
  final Branch branch;
  final int change;
  final Currency currency;
  final bool processed;
  final DateTime added;
  final DateTime changed;

  MoneyNode({this.id, this.branch, this.change, this.currency, this.processed, this.added, this.changed});
}
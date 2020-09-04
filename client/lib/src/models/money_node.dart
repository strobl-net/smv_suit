import 'package:client/src/types/branch.dart';
import 'package:client/src/types/currency.dart';

class MoneyNode {
  final int id;
  Branch branch;
  int change;
  Currency currency;
  bool processed;
  DateTime added;
  DateTime changed; // OPTIONAL

  MoneyNode(this.id, this.branch, this.change, this.currency, this.processed, this.added, this.changed);
}
import 'package:client/src/models/money_node.dart';
import 'package:client/src/models/transaction_entity.dart';

class Transaction {
  final int id;
  String description; // OPTIONAL
  TransactionEntity sender;
  bool sender_local;
  TransactionEntity receiver;
  bool receiver_local;
  MoneyNode money_node;
  DateTime added;
  DateTime changed; // OPTIONAL

  Transaction(this.id, this.description, this.sender, this.sender_local, this.receiver, this.receiver_local, this.money_node, this.added, this.changed);
}
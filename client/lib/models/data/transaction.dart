import 'package:client/models/data/transaction_entity.dart';

import 'money_node.dart';

class Transaction {
  final int id;
  final String description;
  final TransactionEntity sender;
  final bool senderLocal;
  final TransactionEntity receiver;
  final bool receiverLocal;
  final MoneyNode moneyNode;
  final DateTime added;
  final DateTime changed;

  Transaction({this.id, this.description, this.sender, this.senderLocal, this.receiver, this.receiverLocal, this.moneyNode, this.added, this.changed});
}
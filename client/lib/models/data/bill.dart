import 'package:client/models/data/person.dart';
import 'package:client/models/data/product.dart';
import 'package:client/models/data/transaction.dart';

class Bill {
  final int id;
  final DateTime received;
  final DateTime processed;
  final List<Product> products;
  final Person responsible;
  final Transaction transaction;
  final DateTime added;
  final DateTime changed;

  Bill({this.id, this.received, this.processed, this.products, this.responsible, this.transaction, this.added, this.changed});
}
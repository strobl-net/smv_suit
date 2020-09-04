import 'package:client/src/models/person.dart';
import 'package:client/src/models/product.dart';
import 'package:client/src/models/transaction.dart';

class Bill {
  final int id;
  DateTime received;
  DateTime processed; // OPTIONAL
  List<Product> products; // OPTIONAL
  Person responsible; // OPTIONAL
  Transaction transaction;
  DateTime added;
  DateTime changed;

  Bill(this.id, this.received, this.processed, this.products, this.responsible, this.transaction, this.added, this.changed);
}
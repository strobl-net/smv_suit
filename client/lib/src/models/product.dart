import 'package:client/src/models/transaction_entity.dart';
import 'package:client/src/types/currency.dart';

class Product {
  final int id;
  String name;
  String description; // OPTIONAL
  int change; // OPTIONAL
  Currency currency; // OPTIONAL
  TransactionEntity provider; // OPTIONAL
  List<String> tags; // OPTIONAL
  DateTime added;
  DateTime changed; // OPTIONAL

  Product(this.id, this.name, this.description, this.change, this.currency, this.provider, this.tags, this.added, this.changed);
}


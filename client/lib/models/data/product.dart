import 'package:client/models/data/types.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final int change;
  final Currency currency;
  final List<String> tags;
  final DateTime added;
  final DateTime changed;

  Product({this.id, this.name, this.description, this.change, this.currency, this.tags, this.added, this.changed});
}


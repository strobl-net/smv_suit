import 'package:client/models/data/person.dart';
import 'package:flutter/material.dart';

class BillViewModel extends ChangeNotifier {
}

class PersonViewModel extends ChangeNotifier {
  final _persons = [
    Person(
        id: 0,
        name: "sebastian",
        email: "sebastian@test.com",
        phone: "037-234-2713",
        tags: ["admin", "developer", "smv"],
        added: DateTime.now()
    ),
    Person(
        id: 1,
        name: "Max Mustermann",
        email: "sebastian@test.com",
        phone: "037-234-2713",
        tags: ["test", "student"],
        added: DateTime.now()
    )
  ];

  List<Person> get persons => _persons;
}
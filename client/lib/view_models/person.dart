import 'package:flutter/material.dart';
import 'package:client/models/data/person.dart';

class PersonViewModel extends ChangeNotifier {
  final persons = [
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
        email: "max@mustermann.com",
        phone: "037-234-2713",
        tags: ["test", "student"],
        added: DateTime.now()
    )
  ];
}
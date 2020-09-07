import 'package:client/models/data/person.dart';
import 'package:flutter/material.dart';

import 'person_item.dart';

class PersonList extends StatelessWidget {
  final List<Person> persons;
  const PersonList({this.persons});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      children: [
        ...persons.map(
            (person) => PersonItem(model: person),
        )
      ],
    );
  }
}

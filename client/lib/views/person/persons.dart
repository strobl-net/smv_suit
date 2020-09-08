import 'package:client/view_models/person.dart';
import 'package:client/widgets/admin/persons/persons_list.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Persons extends StatelessWidget {
  const Persons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PersonViewModel>.reactive(
      viewModelBuilder: () => PersonViewModel(),
      onModelReady: (model) => model.getPersons(),
      builder: (context, model, child) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            model.persons == null
              ? CircularProgressIndicator()
              : PersonList(persons: model.persons),
          ]
        ),
      ),
    );
  }
}

import 'package:client/models/data/person.dart';
import 'package:client/services/api/api.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PersonViewModel extends ChangeNotifier {
  final _api = GetIt.I<API>();
  List<Person> _persons;
  List<Person> get persons => _persons;

  Future getPersons() async {
    _api.getPersons();
    // _persons = personResults;
    notifyListeners();
  }
}
import 'package:client/client.dart';
import 'package:client/services/navigation/navigation_service.dart';
import 'package:client/views/layouts/default.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  GetIt.I.registerLazySingleton(() => NavigationService());
  setup();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SMVSuit",
      home: DefaultLayout(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Open Sans',
        ),
      ),
    );
  }
}

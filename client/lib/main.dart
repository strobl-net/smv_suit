import 'package:client/client.dart';
import 'package:client/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  final client = await initClient();
  GetIt.I.registerLazySingleton(() => client);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SMVSuit",
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Open Sans',
        ),
      ),
    );
  }
}

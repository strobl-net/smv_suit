import 'package:client/client.dart';
import 'package:client/views/layouts/default.dart';
import 'package:flutter/material.dart';

void main() async {
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

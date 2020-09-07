import 'package:flutter/material.dart';

class ContentDesktop extends StatelessWidget {
  const ContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("All Bills Desktop")
      ],
    );
  }
}
import 'package:client/widgets/action/button.dart';
import 'package:flutter/material.dart';

import 'content.dart';

class ContentMobile extends StatelessWidget {
  const ContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        About(),
        SizedBox(height: 100),
        Button("Join Us")
      ],
    );
  }
}
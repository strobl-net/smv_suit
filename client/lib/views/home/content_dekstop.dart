import 'package:client/widgets/action/button.dart';
import 'package:flutter/material.dart';

import 'content.dart';

class ContentDesktop extends StatelessWidget {
  const ContentDesktop({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        About(),
        Expanded(
            child: Center(
              child: Button("Join Us"),
            )
        ),
      ],
    );
  }
}



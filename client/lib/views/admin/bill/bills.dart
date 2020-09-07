import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'content_desktop.dart';
import 'content_mobile.dart';

class Bills extends StatelessWidget {
  const Bills({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ContentMobile(),
      desktop: ContentDesktop(),
    );
  }
}

import 'package:client/widgets/structure/navigation_bar/desktop.dart';
import 'package:client/widgets/structure/navigation_bar/mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      desktop: NavigationBarDesktop(),
    );
  }

}


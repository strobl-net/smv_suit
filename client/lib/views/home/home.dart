import 'package:client/views/home/content_dekstop.dart';
import 'package:client/views/home/content_mobile.dart';
import 'package:client/widgets/structure/centered.dart';
import 'package:client/widgets/structure/navigation_bar/navigation_bar.dart';
import 'package:client/widgets/structure/navigation_drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Scaffold(
            drawer: sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? null
                : NavigationDrawer(),
            backgroundColor: Colors.white,
            body: Centered(
              child: Column(
                children: <Widget>[
                  NavigationBar(),
                  Expanded(
                      child: ScreenTypeLayout(
                        mobile: ContentMobile(),
                        desktop: ContentDesktop(),
                      )
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}

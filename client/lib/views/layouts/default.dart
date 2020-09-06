import 'package:client/services/navigation/navigation_service.dart';
import 'package:client/services/navigation/routing/route_names.dart';
import 'package:client/services/navigation/routing/router.dart';
import 'package:client/widgets/structure/centered.dart';
import 'package:client/widgets/structure/navigation_bar/navigation_bar.dart';
import 'package:client/widgets/structure/navigation_drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
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
                  child: Navigator(
                    key: GetIt.I<NavigationService>().navigatorKey,
                    onGenerateRoute: generateRoute,
                    initialRoute: HomeRoute,
                  )
              )
            ],
          ),
        ),
      );
    });
  }
}

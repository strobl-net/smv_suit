import 'package:client/services/navigation/routing/route_names.dart';
import 'package:client/views/about/about.dart';
import 'package:client/views/account/account.dart';
import 'package:client/views/admin/admin.dart';
import 'package:client/views/home/home.dart';
import 'package:client/views/news/news.dart';
import 'package:client/views/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return getPageRoute(Home());
    case NewsRoute:
      return getPageRoute(News());
    case AboutRoute:
      return getPageRoute(About());
    case AdminRoute:
      return getPageRoute(Admin());
    case AccountRoute:
      return getPageRoute(Account());
    case SettingsRoute:
      return getPageRoute(Settings());
    default:
      // TODO: Error Handling
      return getPageRoute(Home());
  }
}

PageRoute getPageRoute(Widget child) {
  return FadeRoute(child: child);
}

class FadeRoute extends PageRouteBuilder {
  final Widget child;

  FadeRoute({this.child})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(opacity: animation, child: child));
}

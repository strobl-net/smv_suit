import 'package:client/services/navigation/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'item.dart';

class NavigationBarDesktop extends StatelessWidget {
  const NavigationBarDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem("Home", HomeRoute),
              SizedBox(width: 60),
              NavBarItem("News", NewsRoute),
              SizedBox(width: 60),
              NavBarItem("About", AboutRoute),
              SizedBox(width: 60),
              NavBarItem("Admin", AdminRoute),
              SizedBox(width: 60),
              NavBarItem("Persons", PersonsRoute),
              SizedBox(width: 60),
              NavBarItem("Account", AccountRoute),
            ],
          ),
        ],
      ),
    );
  }
}

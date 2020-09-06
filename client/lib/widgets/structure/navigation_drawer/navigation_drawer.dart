import 'package:client/services/navigation/routing/route_names.dart';
import 'package:client/widgets/structure/navigation_bar/item.dart';
import 'package:client/widgets/structure/navigation_drawer/header.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          NavBarItem("Home", HomeRoute, icon: Icons.house),
          NavBarItem("News", NewsRoute, icon: Icons.fiber_new),
          NavBarItem("About", AboutRoute, icon: Icons.description),
          NavBarItem("Admin", AdminRoute, icon: Icons.person),
          NavBarItem("Account", AccountRoute, icon: Icons.person),
          NavBarItem("Settings", SettingsRoute, icon: Icons.settings),
        ],
      ),
    );
  }
}

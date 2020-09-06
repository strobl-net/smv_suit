import 'package:client/services/navigation/routing/route_names.dart';
import 'package:client/widgets/structure/navigation_drawer/item.dart';
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
          DrawerItem("Home", Icons.house, HomeRoute),
          DrawerItem("News", Icons.fiber_new, NewsRoute),
          DrawerItem("About", Icons.description, AboutRoute),
          DrawerItem("Admin", Icons.person, AdminRoute),
          DrawerItem("Account", Icons.person, AccountRoute),
          DrawerItem("Settings", Icons.settings, SettingsRoute)
        ],
      ),
    );
  }
}

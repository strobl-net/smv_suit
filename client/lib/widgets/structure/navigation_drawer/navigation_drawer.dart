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
          DrawerItem("News", Icons.fiber_new),
          DrawerItem("About", Icons.description),
          DrawerItem("Admin", Icons.person),
          DrawerItem("Account", Icons.person),
          DrawerItem("Settings", Icons.settings)
        ],
      ),
    );
  }
}

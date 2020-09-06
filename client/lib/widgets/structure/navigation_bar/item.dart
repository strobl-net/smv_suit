import 'package:client/services/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem(this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          GetIt.I<NavigationService>().navigateTo(navigationPath);
        },
        child: Text(
          title,
          style: TextStyle(
          fontSize: 18
          ),
        )
    );
  }
}

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: 150,
        child: Image.asset('assets/images/logo.png')
    );
  }
}
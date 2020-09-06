import 'package:client/models/navigation_bar_item.dart';
import 'package:client/services/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;
  const NavBarItem(this.title, this.navigationPath, {this.icon});

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
      iconData: icon
    );
    return GestureDetector(
        onTap: () {
          GetIt.I<NavigationService>().navigateTo(navigationPath);
        },
      child: ScreenTypeLayout(
          tablet: NavBarItemDesktop(model: model),
          mobile: NavBarItemMobile(model: model),
        ),
    );
  }
}

class NavBarItemDesktop extends StatelessWidget {
  final NavBarItemModel model;
  NavBarItemDesktop({this.model});

  @override
  Widget build(
      BuildContext context,
      ) {
    return Text(
      model.title,
      style: TextStyle(fontSize: 18),
    );
  }
}

class NavBarItemMobile extends StatelessWidget {
  final NavBarItemModel model;
  NavBarItemMobile({this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(model.iconData),
          SizedBox(
            width: 30,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
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
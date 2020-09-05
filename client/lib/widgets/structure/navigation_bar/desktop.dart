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
              NavBarItem("Hello"),
              SizedBox(width: 60),
              NavBarItem("World"),
            ],
          ),
        ],
      ),
    );
  }
}

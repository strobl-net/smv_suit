import 'package:client/constants/colors.dart';
import 'package:flutter/material.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: freshGreen,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Sample Name",
            style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white
            ),
          ),
          Text(
            "Sample Rank",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

}
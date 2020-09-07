import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? TextAlign.left
                : TextAlign.center;

        double titleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? 80
                : 55;

        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? 21
                : 17;

        return Container(
            width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'SMV-Team \nWho are we?',
                  style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w800,
                      height: 0.9),
                  textAlign: textAlignment,
                ),
                SizedBox(
                  height: 30,
                ),
                SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(fontSize: descriptionSize, height: 1.7),
                  textAlign: textAlignment,
                )
              ],
            ));
      },
    );
  }
}

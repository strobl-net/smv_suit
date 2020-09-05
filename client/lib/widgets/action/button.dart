import 'package:client/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Button extends StatelessWidget {
  final String title;
  Button(this.title);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ButtonMobile(title),
      tablet: ButtonDesktop(title),
      desktop: ButtonDesktop(title),
    );
  }

}

class ButtonDesktop extends StatelessWidget {
  final String title;
  ButtonDesktop(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
          color: freshGreen,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}

class ButtonMobile extends StatelessWidget {
  final String title;
  ButtonMobile(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 31, 229, 146),
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}
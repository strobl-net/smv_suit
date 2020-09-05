import 'package:flutter/material.dart';

class Centered extends StatelessWidget {
  final Widget child;
  const Centered({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 70
      ),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: 1200
        ),
        child: child,
      ),
    );
  }
}
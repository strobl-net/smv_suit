import 'package:client/models/data/person.dart';
import 'package:flutter/material.dart';

class PersonItem extends StatelessWidget {
  final Person model;
  const PersonItem({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: SizedBox(
        width: 360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              model.name + "|" + model.id.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            Text(
              model.email,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ],
        )
      )
    );
  }

}
import 'package:flutter/material.dart';
import 'package:bmi/Constants.dart';

class ReusableColumn extends StatelessWidget {
  ReusableColumn({this.cardICon,this.cardText});
  final IconData cardICon;
  final String cardText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardICon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          cardText,
          style:labelTextStyle,
        )
      ],
    );
  }
}

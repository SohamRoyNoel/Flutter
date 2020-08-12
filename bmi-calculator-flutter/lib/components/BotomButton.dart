import 'package:flutter/material.dart';

import '../constants/Constants.dart';

class BotomButton extends StatelessWidget {
  String calculateString;
  String navPath;
  final Function tapFunction;

  BotomButton({@required this.calculateString, @required this.tapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Container(
        color: botomBarColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: botomBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              calculateString,
              style: KBigButtonFont,
            ),
          ],
        ),
      ),
    );
  }
}

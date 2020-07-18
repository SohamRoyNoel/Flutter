import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  DicePage_State createState() => DicePage_State();
}

class DicePage_State extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1, // 1st mal will take twice space then the 2nd mal
            child: FlatButton(
              onPressed: () {
                setState(() {
                  leftDice = giveRandom();
                  rightDice = giveRandom();
                });
              },
              child: Image(
                image: AssetImage('images/dice$leftDice.png'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  leftDice = giveRandom();
                  rightDice = giveRandom();
                });
              },
              child: Image.asset('images/dice$rightDice.png'),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  int giveRandom() {
    var range = new Random();
    int min = 1;
    int dice = min + range.nextInt(6);
    return dice;
  }
}

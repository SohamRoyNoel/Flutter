import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
              image: //NetworkImage('https://wallpapercave.com/wp/wp4596547.jpg'),
                  AssetImage(
                      'images/diamonds-clipart-transparent-background-9.png')),
        ),
      ),
    ),
  );
}

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('My Piano'),
            backgroundColor: Colors.redAccent,
          ),
          body: XylophoneApp(),
        ),
      ),
    );

class XylophoneApp extends StatelessWidget {
  final audioPalyer = AudioCache();

  /*
  * Addressing random sound Nodes
  * */
  void audioStream(int strokeNumber) {
    audioPalyer.play('note$strokeNumber.wav');
  }

  /*
  * calling flat button :: in case of inline code we can use FAT arrow
  * */
  Expanded returnFlatbutton({Color color, int number}) => Expanded(
        child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: color,
          onPressed: () {
            audioStream(number);
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            returnFlatbutton(color: Colors.deepOrange, number: 1),
            returnFlatbutton(color: Colors.blueAccent, number: 2),
            returnFlatbutton(color: Colors.amberAccent, number: 3),
            returnFlatbutton(color: Colors.indigoAccent, number: 4),
            returnFlatbutton(color: Colors.greenAccent, number: 5),
            returnFlatbutton(color: Colors.black12, number: 6),
            returnFlatbutton(color: Colors.lightBlueAccent, number: 7),
          ],
        ),
      ),
    );
  }
}

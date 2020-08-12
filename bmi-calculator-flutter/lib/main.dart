import 'package:flutter/material.dart';

import 'input_page.dart';
import 'screen2/result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0A0E20),
        primaryColor: Color(0xff0A0E21),
        accentColor: Colors.greenAccent,
      ),
      home: InputPage(),
      routes: {
        '/result': (context) => Result_Page(),
        '/inputpage': (context) => InputPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class GenderIcons extends StatelessWidget {
  final Icon fontawesomeIcon;
  final double size;
  final String gender;
  GenderIcons(
      {@required this.fontawesomeIcon,
      @required this.size,
      @required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        fontawesomeIcon,
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: textStyle,
        )
      ],
    );
  }
}

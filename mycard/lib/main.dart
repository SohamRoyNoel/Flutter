import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade800,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://scontent-bom1-2.xx.fbcdn.net/v/t1.0-9/s960x960/44921168_555127188273614_6345994624301006848_o.jpg?_nc_cat=107&_nc_sid=7aed08&_nc_ohc=qxzwyKs5uxEAX-v7hM_&_nc_ht=scontent-bom1-2.xx&_nc_tp=7&oh=40ededcd52aeb47af6cba6d20b066ad4&oe=5F3579B5'),
            ),
            Text(
              'Suchismita Dey',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Textile Designer',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.teal.shade100,
                    fontSize: 15,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 250,
              height: 20,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 5,
                left: 30,
                right: 30,
              ),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal.shade500,
                  size: 20,
                ),
                title: Text(
                  '+91 76879 12205',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.teal.shade500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal.shade500,
                  size: 20,
                ),
                title: Text(
                  'deysuchismita97@gmail.com',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.teal.shade500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

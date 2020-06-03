import 'package:flutter/material.dart';
import 'package:hgt/home.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 180.0),
            Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'H',
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.red,
                                decorationColor: Colors.white)),
                        TextSpan(
                            text: 'G',
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.yellow,
                                decorationColor: Colors.white)),
                        TextSpan(
                            text: 'T',
                            style: TextStyle(
                                fontSize: 70,
                                color: Colors.green,
                                decorationColor: Colors.white))
                      ]),
                ),
              ],
            ),
            SizedBox(height: 75.0),
            Column(
              children: <Widget>[
                Container(
                  width: 360,
                  child: FlatButton(
                      child: Text("Handong Time"),
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
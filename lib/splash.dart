import 'package:flutter/material.dart';
import 'package:hgt/home.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: phoneSize.height*.4),
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
            SizedBox(height: phoneSize.height * .35),
            Column(
              children: <Widget>[
                Container(
                  child: InkWell(
                      child: Text("Handong Time"),
                      onTap: () async {
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
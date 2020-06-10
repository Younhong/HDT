import 'package:flutter/material.dart';
import 'package:hgt/login.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _SplashPageState();

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
            SizedBox(height: phoneSize.height * .15),
            Container(
              alignment: Alignment.center,
              child: FlatButton(
                child: Text("Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25),),
                onPressed: () =>
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage())),
              ),
            ),
            SizedBox(height: phoneSize.height * .15),
            Column(
              children: <Widget>[
                Text("Handong Time")
              ],
            )
          ],
        );
      }),
    );
  }
}
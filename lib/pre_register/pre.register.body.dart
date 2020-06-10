import 'package:flutter/material.dart';
import 'package:hgt/pre_register/pre.comp.dart';

class PreRegisterBodyPage extends StatefulWidget{
  _PreRegisterBodyState createState() => _PreRegisterBodyState();
}

class _PreRegisterBodyState extends State<PreRegisterBodyPage> {
  _PreRegisterBodyState();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            FlatButton(
              child: Text("인원별 조회"),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PreCompPage())),
            ),
            SizedBox(width: 10),
            FlatButton(
              child: Text("경쟁률 조회"),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PreCompPage())),
            )
          ],
        )
      ],
    );
  }
}
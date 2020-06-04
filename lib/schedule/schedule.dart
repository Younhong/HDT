import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget{
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  _SchedulePageState();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            child: FlatButton(
              child: Text("시간표"),
              /// TODO::: Implement Schedule UI
              onPressed: null,
            )
        )
      ],
    );
  }
}
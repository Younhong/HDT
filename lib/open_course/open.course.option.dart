import 'package:flutter/material.dart';

class OpenCourseOptionPage extends StatefulWidget{
  _OpenCourseOptionPageState createState() => _OpenCourseOptionPageState();
}

class _OpenCourseOptionPageState extends State<OpenCourseOptionPage> {
  _OpenCourseOptionPageState();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: FlatButton(
            child: Text("Option"),
            /// TODO::: Implement button action
            /// TODO::: DropDownMenu
            onPressed: null,
          )
        )
      ],
    );
  }
}
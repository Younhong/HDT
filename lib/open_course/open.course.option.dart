import 'package:flutter/material.dart';

class OpenCourseOptionPage extends StatefulWidget{
  final String option;
  OpenCourseOptionPage(this.option);

  _OpenCourseOptionState createState() => _OpenCourseOptionState();
}

class _OpenCourseOptionState extends State<OpenCourseOptionPage> {
  _OpenCourseOptionState();

  @override
  Widget build(BuildContext context) {
    return Text(widget.option);
  }
}

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
    if (widget.option == "Option") {
      return Column(
        children: <Widget>[
          Text("전체 강좌 조회")
        ],
      );
    }
    else if (widget.option == "Course Name") {
      return Column(
        children: <Widget>[
          Text("강의명 검색")
        ],
      );
    }
    else if (widget.option == "Prof Name") {
      return Column(
        children: <Widget>[
          Text("교수명 검색")
        ],
      );
    }
    else
      return Text(widget.option);
  }
}

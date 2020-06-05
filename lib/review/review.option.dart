import 'package:flutter/material.dart';

class ReviewOptionPage extends StatefulWidget{
  final String option;
  ReviewOptionPage(this.option);

  _ReviewOptionState createState() => _ReviewOptionState();
}

class _ReviewOptionState extends State<ReviewOptionPage> {
  _ReviewOptionState();

  @override
  Widget build(BuildContext context) {
    if (widget.option == "Option") {
      return Column(
        children: <Widget>[
          Text("전체 리뷰")
        ],
      );
    }
    else if (widget.option == "Course Name") {
      return Column(
        children: <Widget>[
          Text("강의별 검색")
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

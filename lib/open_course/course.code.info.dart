import 'package:flutter/material.dart';

class CourseCodeInfo extends StatelessWidget {
  final String courseCodeInfo;
  CourseCodeInfo(this.courseCodeInfo);

  Widget build(BuildContext context) {
    return Container(
      child: courseCodeInfo != ""
          ? Text(courseCodeInfo + " 과목 쭉 나열") : null,
    );
  }
}
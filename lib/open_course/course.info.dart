import 'package:flutter/material.dart';

class CourseInfo extends StatelessWidget {
  final String courseInfo;
  CourseInfo(this.courseInfo);

  Widget build(BuildContext context) {
    return Container(
      child: courseInfo != "" ? Text(courseInfo + " 정보 쭉 나열") : null,
    );
  }
}
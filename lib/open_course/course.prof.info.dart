import 'package:flutter/material.dart';

class CourseProfInfo extends StatelessWidget {
  final String courseProfInfo;
  CourseProfInfo(this.courseProfInfo);

  Widget build(BuildContext context) {
    return Container(
      child: courseProfInfo != ""
          ? Text(courseProfInfo + " 교수님 과목 쭉 나열") : null,
    );
  }
}
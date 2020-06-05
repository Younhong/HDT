import 'package:flutter/material.dart';

class CourseInjung extends StatelessWidget {
  final String courseInjung;
  CourseInjung(this.courseInjung);

  Widget build(BuildContext context) {
    return Text(courseInjung + "에 해당되는 과목 쭉 나열");
  }
}
import 'package:flutter/material.dart';

class DeptCourse extends StatelessWidget {
  final String deptCourse;
  DeptCourse(this.deptCourse);

  Widget build(BuildContext context) {
    return Text(deptCourse + "에 해당되는 과목 쭉 나열");
  }
}
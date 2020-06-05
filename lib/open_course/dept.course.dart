import 'package:flutter/material.dart';

class DeptCourse extends StatelessWidget {
  final String selected;
  DeptCourse(this.selected);

  Widget build(BuildContext context) {
    return Text(selected + "에 해당되는 과목 쭉 나열");
  }
}
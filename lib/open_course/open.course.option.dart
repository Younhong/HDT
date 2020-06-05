import 'package:flutter/material.dart';
import 'package:hgt/open_course/dept.course.dart';

class OpenCourseOptionPage extends StatefulWidget{
  final String option;
  OpenCourseOptionPage(this.option);

  _OpenCourseOptionState createState() => _OpenCourseOptionState();
}

class _OpenCourseOptionState extends State<OpenCourseOptionPage> {
  _OpenCourseOptionState();

  List<String> _deptCategory = ['GLS', 'CSEE', 'Law', 'Life Science'];
  String _selectedDept = "GLS";

  @override
  Widget build(BuildContext context) {
    if (widget.option == "Option") {
      return Column(
        children: <Widget>[
          Text("전체 강좌 조회"),
          Text("옵션 없이 전체 강좌 찾아서 쭉 나열")
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
    else if (widget.option == "Dept Name") {
      return Column(
        children: <Widget>[
          Text("학부별 검색"),
          DropdownButton(
            hint: Text('Option'),
            value: _selectedDept,
            icon: Icon(Icons.arrow_drop_down),
            onChanged: (String newValue) {
              setState(() { _selectedDept = newValue;});
            },
            items: _deptCategory
                .map((String category) {
              return DropdownMenuItem<String>(
                value: category, child: Text(category),
              );
            }).toList(),
          ),
          DeptCourse(_selectedDept),
        ],
      );
    }
    else
      return Text(widget.option);
  }
}

import 'package:flutter/material.dart';
import 'package:hgt/open_course/open.course.option.dart';

class OpenCourseBodyPage extends StatefulWidget{
  _OpenCourseBodyState createState() => _OpenCourseBodyState();
}

class _OpenCourseBodyState extends State<OpenCourseBodyPage> {
  _OpenCourseBodyState();
  List<String> _category = ['Option', 'Course Name', 'Prof Name', 'Dept Name', 'Injung'];

  String _selected = "Option";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 50),
          child: DropdownButton(
            hint: Text('Option'),
            value: _selected,
            icon: Icon(Icons.arrow_drop_down),
//            iconSize: 24,
//            elevation: 1,
            onChanged: (String newValue) {
              setState(() { _selected = newValue;});
            },
            items: _category
                .map((String category) {
              return DropdownMenuItem<String>(
                value: category, child: Text(category),
              );
            }).toList(),
          ),
        ),
        OpenCourseOptionPage(_selected),
      ],
    );
  }
}
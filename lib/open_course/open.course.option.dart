import 'package:flutter/material.dart';
import 'package:hgt/open_course/course.code.info.dart';
import 'package:hgt/open_course/course.info.dart';
import 'package:hgt/open_course/course.injung.dart';
import 'package:hgt/open_course/course.prof.info.dart';
import 'package:hgt/open_course/dept.course.dart';

class OpenCourseOptionPage extends StatefulWidget{
  final String option;
  OpenCourseOptionPage(this.option);

  _OpenCourseOptionState createState() => _OpenCourseOptionState();
}

class _OpenCourseOptionState extends State<OpenCourseOptionPage> {
  _OpenCourseOptionState();

  /// TODO:: 학부 더 추가
  List<String> _deptCategory = ['GLS', 'CSEE', 'Law', 'Life Science'];
  List<String> _injungCategory = ['신앙1', '신앙2', '인성1', '인성2', '세계관1', '세계관2'];
  String _selectedDept = "GLS";
  String _selectedInjung = "신앙1";
  final TextEditingController _profController = new TextEditingController();
  final TextEditingController _courseNameController = new TextEditingController();
  final TextEditingController _courseCodeController = new TextEditingController();
  String _profName = "";
  String _courseName = "";
  String _courseCode = "";

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
    else if (widget.option == "교양실무영역") {
      return Column(
        children: <Widget>[
          Text("교양실무영역 검색"),
          DropdownButton(
            hint: Text('Option'),
            value: _selectedInjung,
            icon: Icon(Icons.arrow_drop_down),
            onChanged: (String newValue) {
              setState(() { _selectedInjung = newValue;});
            },
            items: _injungCategory
                .map((String category) {
              return DropdownMenuItem<String>(
                value: category, child: Text(category),
              );
            }).toList(),
          ),
          CourseInjung(_selectedInjung),
        ],
      );
    }
    else if (widget.option == "과목명") {
      return Column(
        children: <Widget>[
          Text("강의명 검색"),
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  autocorrect: false,
                  controller: _courseNameController,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.red,
                      hintText: "수업명을 입력해주세요",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: 16.0),
                      contentPadding: EdgeInsets.only(left: 100)),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: _courseNameController.text != null
                    ? () => _handleSubmitted(_courseNameController.text, 1)
                    : null,
              ),
            ],
          ),
          CourseInfo(_courseName),
        ],
      );
    }
    else if (widget.option == "교수명") {
      return Column(
        children: <Widget>[
          Text("교수명 검색"),
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  autocorrect: false,
                  controller: _profController,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.red,
                      hintText: "교수명을 입력해주세요",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: 16.0),
                      contentPadding: EdgeInsets.only(left: 100)),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: _profController.text != null
                    ? () => _handleSubmitted(_profController.text, 2)
                    : null,
              ),
            ],
          ),
          CourseProfInfo(_profName)
        ],
      );
    }
    else if (widget.option == "학부") {
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
    else if (widget.option == "과목코드") {
      return Column(
        children: <Widget>[
          Text("과목코드 검색"),
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  autocorrect: false,
                  controller: _courseCodeController,
                  maxLines: 1,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.red,
                      hintText: "과목코드를 입력해주세요",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: 16.0),
                      contentPadding: EdgeInsets.only(left: 100)),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: _courseCodeController.text != null
                    ? () => _handleSubmitted(_courseCodeController.text, 3)
                    : null,
              ),
            ],
          ),
          CourseCodeInfo(_courseCode)
        ],
      );
    }
    else
      return Text(widget.option);
  }

  Widget _handleSubmitted(String text, int index) {
    if (index == 1) {
      _courseNameController.clear();
      setState(() {
        _courseName = text;
      });
    }
    else if (index == 2) {
      _profController.clear();
      setState(() {
        _profName = text;
      });
    }
    else if (index == 3) {
      _courseCodeController.clear();
      setState(() {
        _courseCode = text;
      });
    }

    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:hgt/open_course/course.search.result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PreRegisterBodyPage extends StatefulWidget{
  _PreRegisterBodyState createState() => _PreRegisterBodyState();
}

class _PreRegisterBodyState extends State<PreRegisterBodyPage> {
  @override
  void initState() {
    super.initState();
    setState(()  {
      this.courseJSON('http://52.14.37.173:5000/majorList');
      this.injungJSON('http://52.14.37.173:5000/injungList');
    });
  }

  _PreRegisterBodyState();
  List _deptCategory = List();
  List _injungCategory = List();
  List<String> _yearCategory = ['2019', '2020'];
  List<String> _semesterCategory = ['1', '2', '3', '4'];
  String _selectedDept = "1" ;
  String _selectedInjung = '000';
  String _selectedYear = '2020';
  String _selectedSemester = '1';
  final TextEditingController _profController = new TextEditingController();
  final TextEditingController _courseNameController = new TextEditingController();
  String _profName = "";
  String _courseName = "";
  String _courseCode = "";

  List data;

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, top: 30),
              width: phoneSize.width * .85,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      DropdownButton(
                        value: _selectedYear,
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (String newValue) {
                          setState(() { _selectedYear = newValue;});
                        },
                        items: _yearCategory
                            .map((String category) {
                          return DropdownMenuItem<String>(
                            value: category, child: Text(category),
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 20),
                      DropdownButton(
                        value: _selectedSemester,
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (String newValue) {
                          setState(() { _selectedSemester = newValue;});

                        },
                        items: _semesterCategory
                            .map((String category) {
                          return DropdownMenuItem<String>(
                            value: category, child: Text(category),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DropdownButton(
                        icon: Icon(Icons.arrow_drop_down),
                        items: _deptCategory.map((major) {
                          return DropdownMenuItem<String>(
                            value: major['major_code'].toString(), child: Text(major['major_name'].toString(),),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            _selectedDept = newValue;
                          });
                          print(newValue);
                        },
                        value: _selectedDept,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                            width: 100,
                            child: TextField(
                              autocorrect: false,
                              controller: _courseNameController,
                              maxLines: 1,
                              style: TextStyle(color: Colors.black, fontSize: 16.0),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.red,
                                hintText: "과목명",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 16.0),),
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                            width: 70,
                            child: TextField(
                              autocorrect: false,
                              controller: _profController,
                              maxLines: 1,
                              style: TextStyle(color: Colors.black, fontSize: 16.0),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.red,
                                hintText: "교수명",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 16.0),),
                            )
                        ),
                      ),
                      DropdownButton(
                        hint: Text('Option'),
                        value: _selectedInjung,
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (String newValue) {
                          setState(() { _selectedInjung = newValue;});
                        },
                        items: _injungCategory.map((injung) {
                          return DropdownMenuItem<String>(
                            value: injung['inj_code'], child: Text(injung['kor']),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 130),
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      _handleSubmitted(_courseNameController.text, _profController.text);
                      await searchCourse(
                          _selectedDept, _courseName, _selectedInjung, _selectedYear+_selectedSemester, _profName);
                      await Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => CourseSearchResultPage(data)));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          child: Text(_selectedYear + "년도 " +  _selectedSemester + "학기"),
        ),
        Container(
            alignment: Alignment.center,
            child: Text(_selectedDept,)
        ),
        Container(
          alignment: Alignment.center,
          child: Text(_courseName + " " + _courseCode),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(_selectedInjung),
        ),
        SizedBox(height: 10,),
        Text("이 과목의 수강정보를 띄워주세요"),
        Container(
          child: data == null ? Text("hi") : Text("hi2"),
        ),
      ],
    );
  }

  void _handleSubmitted(String courseName, String prof) {
    _courseNameController.clear();
    _profController.clear();
    setState(() {
      _courseName = courseName;
      _profName = prof;
    });

  }

  Future<String> courseJSON(String url) async {
    final response =
    await http.get(url);

    var res = json.decode(response.body);

    setState(() {
      _deptCategory = res;
    });

    print(res);

    return 'Success';
  }

  Future<String> injungJSON(String url) async {
    final response =
    await http.get(url);

    var res = json.decode(response.body);

    setState(() {
      _injungCategory = res;
    });

    print(res);

    return 'Success';
  }

  Future<String> searchCourse(String majorCode, String courseName, String injCode, String yearSemester, String profName) async {
    String url = 'http://52.14.37.173:5000/search?major_code=' +  majorCode + '&open_time=' + yearSemester;

    if (injCode != '000')
      url = url + '&injung_code=' + injCode;
    if (profName != "")
      url = url + '&prof_name=' + profName;
    if (courseName != "")
      url = url + '&course_name=' + courseName;

    print(url);
    final response =
    await http.get(url);

    data = json.decode(response.body);

    setState(() {

    });

    print(data);

    return "Success";
  }
}
import 'package:flutter/material.dart';
import 'package:hdt/pre_register/pre.register.main.dart';
import 'package:hdt/recommend/recommend.page.main.dart';
import 'package:hdt/schedule/my_course.dart';
import 'package:hdt/open_course/open.course.main.dart';
import 'loginInfo.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;

class HomePage extends StatefulWidget {


  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List courseData;
  List userData;

  int _selectedSemester;
  final TextEditingController _semesterController = new TextEditingController();

  _HomeState();


  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: phoneSize.height * 0.10),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'H',
                        style: TextStyle(
                            fontSize: 70,
                            color: Colors.red,
                            decorationColor: Colors.white)),
                    TextSpan(
                        text: 'D',
                        style: TextStyle(
                            fontSize: 70,
                            color: Colors.yellow,
                            decorationColor: Colors.white)),
                    TextSpan(
                        text: 'T',
                        style: TextStyle(
                            fontSize: 70,
                            color: Colors.green,
                            decorationColor: Colors.white))
                  ]),
            ),
            SizedBox(height: phoneSize.height * .05),
            InkWell(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: phoneSize.width * .7,
                    height: phoneSize.height * .07,
                    alignment: Alignment.center,
                    child: Text("개설 시간표 조회",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                        bottomLeft: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0),
                      ),
                      border: Border.all(
                          color: Colors.red, width: 4),
                    ),),
                  Positioned(
                    top: 13,
                    left: -5,
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Icon(Icons.search, size: 40,)
                    ),
                  )
                ],),
              onTap: () async => {
                await Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OpenCourseMainPage(
                                courseData, name, semester, studentID, major, major2))),
              }),
            SizedBox(height: phoneSize.height * .05),
            InkWell(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: phoneSize.width * .7,
                    height: phoneSize.height * .07,
                    alignment: Alignment.center,
                    child: Text("내 시간표",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                        bottomLeft: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0),
                      ),
                      border: Border.all(
                          color: Colors.yellow, width: 4),
                    ),
                  ),
                  Positioned(
                      top: 9,
                      right: 27,
                      child: Icon(Icons.calendar_today, size: 40,)
                  )
                ],
              ),
              onTap: () => {
                _showDialog(),
              }
            ),
            SizedBox(height: phoneSize.height * .05),
            InkWell(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: phoneSize.width * .7,
                    height: phoneSize.height * .07,
                    alignment: Alignment.center,
                    child: Text("예비수강신청",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                        bottomLeft: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0),
                      ),
                      border: Border.all(
                          color: Colors.green, width: 4),
                    ),
                  ),
                  Positioned(
                      top: 9,
                      right: 27,
                      child: Icon(Icons.local_grocery_store, size: 40,)
                  )
                ],
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PreRegisterMainPage(
                              courseData, name, semester, studentID, major, major2))),
            ),
            SizedBox(height: phoneSize.height * .05),
            InkWell(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: phoneSize.width * .7,
                    height: phoneSize.height * .07,
                    alignment: Alignment.center,
                    child: Text("강의 추천",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                        bottomLeft: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0),
                      ),
                      border: Border.all(color: Colors.blue, width: 4),
                    ),
                  ),
                  Positioned(
                      top: 9,
                      right: 27,
                      child: Icon(Icons.check, size: 40,)
                  )
                ],
              ),
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RecommendPage(
                                courseData, name, semester,
                                studentID, major, major2)));

              }
            ),
            SizedBox(height: phoneSize.height * .08),
            Text('Handong Time')
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Future<String> courseJSON(String studentID, String semester) async {
    String url =
        'http://52.14.37.173:5000/my_courses?hakbun=' + studentID + '&semester=' + semester;
    print(url);
    final response = await http.get(url);

    courseData = json.decode(response.body);

    setState(() {
    });

    return 'Success';
  }
  void _showDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: <Widget>[
                Container(
                  child: Text("학기 선택: "),
                ),
                SizedBox(width: 10,),
                Container(
                  child: Flexible(
                    child: TextField(
                      autofocus: true,
                      autocorrect: false,
                      controller: _semesterController,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black, fontSize: 16.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.red,
                        hintText: "학기를 입력해주세요",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: 16.0),),
                    ),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  color: Colors.black,
                  child: Text(
                    "확인",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    _handleSubmitted(_semesterController.text);

                    await courseJSON(studentID, _selectedSemester.toString());
                    await Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyCoursePage(
                                    courseData, name, semester, studentID, major, major2)));
                    Navigator.pop(context);
                  }),
              RaisedButton(
                  child: Text(
                    "취소",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        });
  }

  void _handleSubmitted(String selected) {
    setState(() {
      _selectedSemester = int.parse(selected);
    });

  }
}
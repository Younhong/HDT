import 'package:flutter/material.dart';
import 'package:hgt/loading.dart';
import 'package:hgt/pre_register/pre.register.main.dart';
import 'package:hgt/recommend/recommend.page.main.dart';
import 'package:hgt/schedule/my_course.dart';
import 'package:hgt/open_course/open.course.main.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  final String name, semester, studentID, major, major2;
  HomePage({this.name, this.semester, this.studentID, this.major, this.major2});

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List courseData;

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
                        text: 'G',
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
                LoadingDialog.onLoading(context),
                await Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OpenCourseMainPage(
                                courseData, widget.name, widget.semester, widget.studentID, widget.major, widget.major2))),
                LoadingDialog.dismiss(context, () {})
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
                      top: 13,
                      right: 25,
                      child: Image.asset(
                          'asset/calendar.jpg', width: 50, height: 30)
                  )
                ],
              ),
              onTap: () async => {
                LoadingDialog.onLoading(context),
                await courseJSON(widget.studentID, widget.semester),
                await Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyCoursePage(
                                courseData, widget.name, widget.semester, widget.studentID, widget.major, widget.major2))),
                LoadingDialog.dismiss(context, () {})
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
                      child: Image.asset(
                          'asset/review.png', width: 50, height: 30)
                  )
                ],
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PreRegisterMainPage(
                              courseData, widget.name, widget.semester, widget.studentID, widget.major, widget.major2))),
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
                      border: Border.all(color: Colors.green, width: 4),
                    ),
                  ),
                  Positioned(
                      top: 9,
                      right: 27,
                      child: Image.asset('asset/review.png', width: 50, height: 30)
                  )
                ],
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RecommendPage(
                              courseData, widget.name, widget.semester, widget.studentID, widget.major, widget.major2))),
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
}
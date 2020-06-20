import 'package:flutter/material.dart';
import 'package:hdt/hdt.drawer.dart';
import 'package:hdt/open_course/open.course.body.dart';

class OpenCourseMainPage extends StatelessWidget {
  final courseData;
  final String name, semester, studentID, major, major2;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  OpenCourseMainPage(this.courseData, this.name, this.semester, this.studentID, this.major, this.major2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.menu,
              color: Colors.black,),
            onPressed: () =>
                _scaffoldKey.currentState.openDrawer()),
        backgroundColor: Colors.white,
        title: Text('개설 시간표 조회',
          style: TextStyle(
              color: Colors.black),),
        centerTitle: true,
      ),
      drawer: HDTDrawer(
        courseData, name, semester, studentID, major, major2),
      body: OpenCourseBodyPage(studentID),
      resizeToAvoidBottomInset: false,
    );
  }
}
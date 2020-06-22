import 'package:flutter/material.dart';
import 'package:hdt/hdt.drawer.dart';
import 'package:hdt/open_course/open.course.body.dart';
import 'package:hdt/loginInfo.dart';

class OpenCourseMainPage extends StatelessWidget {
  final courseData;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  OpenCourseMainPage(this.courseData);

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
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.home),
            onPressed: (){
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          )
        ],
      ),
      drawer: HDTDrawer(courseData),
      body: OpenCourseBodyPage(studentID),
      resizeToAvoidBottomInset: false,
    );
  }
}
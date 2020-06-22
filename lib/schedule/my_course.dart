import 'package:flutter/material.dart';
import 'package:hdt/graduate.page.dart';
import 'package:hdt/hdt.drawer.dart';
import 'package:hdt/schedule/schedule.dart';
import 'package:hdt/loginInfo.dart';

class MyCoursePage extends StatelessWidget {
  final courseData;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyCoursePage(this.courseData);

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
        title: Text('내 시간표 조회',
          style: TextStyle(
              color: Colors.black),),
        centerTitle: true,
          actions: <Widget>[
            Row(

              children: <Widget>[
                Text('졸업기준',style: TextStyle(color: Colors.black),),
                IconButton(
                  icon: Icon(Icons.check_circle_outline, color: Colors.black),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GraduatePage(studentID, major))),
                ),
              ],
            ),
          ]
      ),
      drawer: HDTDrawer(courseData),
      body: SchedulePage(courseData, studentID, semester),

      resizeToAvoidBottomInset: false,
    );
  }
}
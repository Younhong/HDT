import 'package:flutter/material.dart';
import 'package:hgt/graduate.page.dart';
import 'package:hgt/hgt.drawer.dart';
import 'package:hgt/schedule/schedule.dart';

class MyCoursePage extends StatelessWidget {
  var courseData;
  final String name, semester, studentID, major, major2;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyCoursePage(this.courseData, this.name, this.semester, this.studentID, this.major, this.major2);

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
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GraduatePage())),
            ),
          ]
      ),
      drawer: HGTDrawer(
          name, semester, studentID, major, major2),
      body: SchedulePage(courseData),
      resizeToAvoidBottomInset: false,
    );
  }
}
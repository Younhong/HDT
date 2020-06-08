import 'package:flutter/material.dart';
import 'package:hgt/hgt.drawer.dart';
import 'package:hgt/schedule/schedule.dart';

class MyCoursePage extends StatelessWidget {
  final String name, semester, studentID, major;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyCoursePage(this.name, this.semester, this.studentID, this.major);

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
      ),
      drawer: HGTDrawer(
          name, semester, studentID, major),
      body: SchedulePage(),
      resizeToAvoidBottomInset: false,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hgt/hgt.drawer.dart';
import 'package:hgt/home.dart';
import 'package:hgt/review/review.body.dart';
import 'package:hgt/schedule/my_course.dart';
import 'package:hgt/open_course/open.course.main.dart';

class ReviewMainPage extends StatelessWidget {
  final String name, semester, studentID, major;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ReviewMainPage(this.name, this.semester, this.studentID, this.major);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReviewBodyPage(),
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
        title: Text('리뷰 조회',
          style: TextStyle(
              color: Colors.black),),
        centerTitle: true,
      ),
      drawer: HGTDrawer(
          name, semester, studentID, major),
      resizeToAvoidBottomInset: false,
    );
  }
}
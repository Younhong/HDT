import 'package:flutter/material.dart';
import 'package:hdt/hdt.drawer.dart';
import 'package:hdt/recommend/recommend.page.body.dart';

class RecommendPage extends StatefulWidget {
  final courseData;
  final String name, semester, studentID, major, major2;
  RecommendPage(this.courseData, this.name, this.semester, this.studentID, this.major, this.major2);

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  _RecommendPageState();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    setState(()  {
//      this.recommendJSON(widget.major, widget.semester);
    });
  }

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
        title: Text('강의 추천',
          style: TextStyle(
              color: Colors.black),),
        centerTitle: true,
      ),
      drawer: HDTDrawer(
          widget.courseData, widget.name, widget.semester, widget.studentID, widget.major, widget.major2),
      body:  RecommendPageBodyPage(widget.major)
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hdt/loading.dart';
import 'package:hdt/open_course/open.course.main.dart';
import 'package:hdt/pre_register/pre.register.main.dart';
import 'package:hdt/recommend/recommend.page.main.dart';
import 'package:hdt/schedule/my_course.dart';import 'package:http/http.dart' as http;
import 'dart:convert';

class HDTDrawer extends StatefulWidget {
  var courseData;
  final String name, semester, studentID, major, major2;
  HDTDrawer(this.courseData, this.name, this.semester, this.studentID, this.major, this.major2);

  @override
  State<StatefulWidget> createState() => _HDTDrawerState();
}

class _HDTDrawerState extends State<HDTDrawer> {
  _HDTDrawerState();

  var phoneSize;
  var courseData;

// CONSTRUCTOR

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    phoneSize = MediaQuery.of(context).size;
    debugPaintSizeEnabled = false;

    return SizedBox(
      width: phoneSize.width * .81,
      child: Drawer(
        child: Container(
          height: double.maxFinite,
          child: Stack(
            children: <Widget>[
              Positioned(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'asset/profile.jpg'),),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(widget.name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 19)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                        title: Text("강의 검색"),
                        leading: Icon(
                          Icons.search, color: Colors.black,),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OpenCourseMainPage(
                                        courseData,
                                          widget.name, widget.semester,
                                          widget.studentID, widget.major, widget.major2
                                      )));
                        }
                    ),
                    ListTile(
                        title: Text("내 시간표 조회"),
                        leading: Icon(
                          Icons.calendar_today, color: Colors.black,),
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
                    ListTile(
                        title: Text("예비 수강 조회"),
                        leading: Icon(
                          Icons.local_grocery_store, color: Colors.black,),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PreRegisterMainPage(courseData,widget.name, widget.semester, widget.studentID, widget.major, widget.major2)));
                        }
                    ),
                    ListTile(
                        title: Text("강의 추천"),
                        leading: Icon(
                          Icons.check, color: Colors.black,),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RecommendPage(courseData, widget.name, widget.semester, widget.studentID, widget.major, widget.major2)));
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

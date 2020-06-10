import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hgt/home.dart';
import 'package:hgt/open_course/open.course.main.dart';
import 'package:hgt/pre_register/pre.register.main.dart';
import 'package:hgt/recommend/recommend.page.main.dart';
import 'package:hgt/schedule/my_course.dart';

class HGTDrawer extends StatefulWidget {
  final String name, semester, studentID, major;
  HGTDrawer(this.name, this.semester, this.studentID, this.major);

  @override
  State<StatefulWidget> createState() => _HGTDrawerState();
}

class _HGTDrawerState extends State<HGTDrawer> {
  _HGTDrawerState();

  var phoneSize;

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
                        title: Text("Home"),
                        leading: Icon(
                          Icons.home, color: Colors.black,),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(
                                          name: widget.name,
                                          semester: widget.semester,
                                          studentID: widget.studentID,
                                          major: widget.major
                                      )));
                        }
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
                                          widget.name, widget.semester,
                                          widget.studentID, widget.major
                                      )));
                        }
                    ),
                    ListTile(
                        title: Text("내 시간표 조회"),
                        leading: Icon(
                          Icons.calendar_today, color: Colors.black,),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyCoursePage(widget.name, widget.semester, widget.studentID, widget.major)));
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
                                      PreRegisterMainPage(widget.name, widget.semester, widget.studentID, widget.major)));
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
                                      RecommendPage(widget.name, widget.semester, widget.studentID, widget.major)));
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
}

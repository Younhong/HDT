import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hgt/home.dart';
import 'package:hgt/review/review.main.dart';
import 'package:hgt/schedule/my_course.dart';

class HGTDrawer extends StatefulWidget {
  final String name, semester, studentID, major;
  HGTDrawer(this.name, this.semester, this.studentID, this.major);

  @override
  State<StatefulWidget> createState() => _HGTDrawerState();
}

class _HGTDrawerState extends State<HGTDrawer> {

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
                            /// TODO:: Login System
                            /// TODO:: (May not be implemented in this course)
                            Container(
                              child: CircleAvatar(
                                backgroundImage: AssetImage('asset/profile.jpg'),),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(widget.name,
                                  style: TextStyle(color: Colors.white, fontSize: 19)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                        title: Text("Home"),
                        leading: Icon(Icons.home, color: Colors.black,),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(
                                          name: widget.name, semester: widget.semester,
                                          studentID: widget.studentID, major: widget.major
                                      )));
                        }
                    ),
                    ListTile(
                        title: Text("My Schedule"),
                        leading: Image.asset('asset/calendar.jpg',
                          width: 25, height: 25),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyCoursePage(widget.name, widget.semester, widget.studentID, widget.major)));
                        }
                    ),
                    ListTile(
                        title: Text("Review"),
                        leading: Image.asset('asset/review.png',
                          width: 25, height: 25),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ReviewMainPage(widget.name, widget.semester, widget.studentID, widget.major)));
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

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hdt/open_course/open.course.main.dart';
import 'package:hdt/recommend/recommend.page.main.dart';
import 'package:hdt/schedule/my_course.dart';import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hdt/loginInfo.dart';

class HDTDrawer extends StatefulWidget {
  final courseData;
  HDTDrawer(this.courseData);

  @override
  State<StatefulWidget> createState() => _HDTDrawerState();
}

class _HDTDrawerState extends State<HDTDrawer> {
  _HDTDrawerState();

  var phoneSize;
  var courseData;

  int _selectedSemester;
  final TextEditingController _semesterController = new TextEditingController();


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
                              child: Text(name,
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
                                      OpenCourseMainPage(courseData,)));
                        }
                    ),
                    ListTile(
                        title: Text("내 시간표 조회"),
                        leading: Icon(
                          Icons.calendar_today, color: Colors.black,),
                        onTap: () async => {
                          _showDialog(),
                        }
                    ),
                    ListTile(
                        title: Text("예비 수강 조회"),
                        leading: Icon(
                          Icons.local_grocery_store, color: Colors.black,),
                        onTap: () => {
                          _showDialog(),
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
                                      RecommendPage(courseData)));
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

  void _showDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: <Widget>[
                Container(
                  child: Text("학기 선택: "),
                ),
                SizedBox(width: 10,),
                Container(
                  child: Flexible(
                    child: TextField(
                      autofocus: true,
                      autocorrect: false,
                      controller: _semesterController,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black, fontSize: 16.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.red,
                        hintText: "학기를 입력해주세요",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: 16.0),),
                    ),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  color: Colors.black,
                  child: Text(
                    "확인",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    _selectedSemester = int.parse(_semesterController.text);


                    await courseJSON(studentID, _selectedSemester.toString());
                    await Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyCoursePage(courseData)));
                    Navigator.pop(context);
                  }),
              RaisedButton(
                  child: Text(
                    "취소",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        });
  }
}

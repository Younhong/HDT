import 'package:flutter/material.dart';
import 'package:hgt/open_course/course.detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseSearchResultPage extends StatefulWidget {
  final List data;
  final String id;
  CourseSearchResultPage(this.data, this.id);

  @override
  _CourseSearchResultState createState() => _CourseSearchResultState();
}

class _CourseSearchResultState extends State<CourseSearchResultPage> {
  _CourseSearchResultState();
  String _selectedSemester = "";
  final TextEditingController _semesterController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('강의 검색 결과', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.data == null
            ? 0 : widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Card(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: phoneSize.width * .4,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(widget.data[index]["title"]),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: phoneSize.width * .4,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: <Widget>[
                              Text("교수명: " + widget.data[index]['prof_name']),
                              SizedBox(width: 13),
                              Text("분반: " + widget.data[index]['section'].toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: phoneSize.width * .4),
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => {
                          _showDialog(index),
                        },
                      ),
                    )
                  ],
                )
            ),
            onTap: () => {
              Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) =>
                        CourseDetailPage(widget.data[index]))
            )},
          );},
      ),
    );
  }

  void _showDialog(int index) async {
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
                  _handleSubmitted(_semesterController.text);
                  Navigator.pop(context);
                  await addCourse(widget.id, widget.data[index]['id'].toString(),
                      widget.data[index]['section'].toString(), _selectedSemester,
                      widget.data[index]['open_id'].toString());
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

  Future<String> addCourse (String userId, String courseCode, String sectionCode, String semester, String openId) async {
    String url = 'http://52.14.37.173:5000/pick?user_id='
        + userId + '&course_code=' + courseCode + '&section_code=' +
        sectionCode + '&semester=' + semester + '&open_id=' + openId;

    print(url);
    final response = await http.get(url);

    var res = json.decode(response.body);

    print(res);
    setState(() {

    });

    return "Success";
  }

  void _handleSubmitted(String text) {
    _semesterController.clear();
    setState(() {
      _selectedSemester = text;
    });
  }
}
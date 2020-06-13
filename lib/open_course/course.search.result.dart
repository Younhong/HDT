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
                          addCourse(widget.id, widget.data[index]['id'].toString(),
                              widget.data[index]['section'].toString(), "8",
                              widget.data[index]['open_id'].toString())
                        },
                      ),
                    )
                  ],
                )
            ),
            onTap: () => Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) =>
                      CourseDetailPage(widget.data[index]))),
          );},
      ),
    );
  }

  void addCourse (String user_id, String course_code, String section_code, String semester, String open_id) async {
    String url = 'http://52.14.37.173:5000/pick?user_id='
        + user_id + '&course_code=' + course_code + '&section_code=' +
        section_code + '&semester=' + semester + '&open_id=' + open_id;

    print(url);
    final response = await http.get(url);

    var res = json.decode(response.body);

    setState(() {

    });
  }
}
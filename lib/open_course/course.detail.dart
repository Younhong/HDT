import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseDetailPage extends StatefulWidget {
  var data;
  CourseDetailPage(this.data);

  @override
  CourseDetailState createState() => CourseDetailState();
}

class CourseDetailState extends State<CourseDetailPage> {
  List reviewList = List();

  @override
  Widget build(BuildContext context) {
    print(widget.data);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () =>
                Navigator.pop(context),
          ),
          title: Text(
            widget.data['title'],
            style: TextStyle(
                color: Colors.black),),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(widget.data['prof_name']),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(widget.data['building']),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(widget.data['time']),
            ),
            FlatButton(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10, top: 30),
                child: Text("수업 리뷰 보기",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),),
              ),
              onPressed: () =>
                  this.reviewJSON(widget.data['title'], widget.data['prof_name'])
            ),
            Container(
              child: reviewList.isEmpty
                  ? Container()
                  : Text(reviewList.length.toString() + "개의 리뷰 검색됨"),
            ),
          ],
      )
    );
  }

  Future<String> reviewJSON(String courseName, String profName) async {
    String url =
        'http://52.14.37.173:5000/review?course_name=' + courseName + '&prof_name=' + profName;
    final response = await http.get(url);

    var res = json.decode(response.body);

    print(res);
    setState(() {
      reviewList = res;
    });

    return 'Success';
  }
}
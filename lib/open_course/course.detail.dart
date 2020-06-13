import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseDetailPage extends StatefulWidget {
  var data;
  CourseDetailPage(this.data);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetailPage> {
  _CourseDetailState();

  List reviewList;

  @override
  Widget build(BuildContext context) {
    print(widget.data);

    var phoneSize = MediaQuery.of(context).size;
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
        body: Column(
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
                  this.reviewJSON(widget.data['id'].toString(), widget.data['prof_name'])
            ),
            Divider(thickness: 1),
            reviewList == null
                ? Container()
                : Expanded(
              child: ListView.builder(
                  itemCount: reviewList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: phoneSize.width * .7,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                                children: <Widget> [
                                  Container(
                                    padding: EdgeInsets.only(left: 10, top:3, bottom: 3),
                                    alignment: Alignment.topLeft,
                                    child: Text("리뷰 " + (index+1).toString()),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left:10, right:10, bottom: 3, top: 3),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      reviewList[index]['description'],),
                                  ),
                                  Divider(thickness: 1),
                                ]
                            )
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
      )
    );
  }

  Future<String> reviewJSON(String courseName, String profName) async {
    String url =
        'http://52.14.37.173:5000/review?course_id=' + courseName + '&prof_name=' + profName;
    print(url);
    final response = await http.get(url);

    var res = json.decode(response.body);
    setState(() {
      reviewList = res;
    });
    print(res);

    return 'Success';
  }
}
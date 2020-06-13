import 'package:flutter/material.dart';
import 'package:hgt/open_course/review.write.dart';
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

  void initState() {
    super.initState();
    setState(() {
      this.reviewJSON(widget.data['id'].toString(), widget.data['prof_name']);
    });
  }


  @override
  Widget build(BuildContext context) {
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
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReviewWritePage(widget.data))),
          child: Icon(Icons.edit, color: Colors.black,),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration:  BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.grey
                    ),//new Color.fromRGBO(255, 0, 0, 0.0),
                    borderRadius:  BorderRadius.circular(5)
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(widget.data['title'],style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text('교수명: ' + widget.data['prof_name']),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text('강의실: '+ widget.data['building']),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text('시간: '+widget.data['time']),
                    ),
                  ],
                ),
              ),
            ),
            Text("수업 리뷰",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold),),
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
import 'package:flutter/material.dart';
import 'package:hgt/open_course/course.detail.dart';

class CourseSearchResultPage extends StatefulWidget {
  final List data;
  CourseSearchResultPage(this.data);

  @override
  CourseSearchResultState createState() => CourseSearchResultState();
}

class CourseSearchResultState extends State<CourseSearchResultPage> {
  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(widget.data[index]["title"]),
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                    ),
                    SizedBox(height: 5),
                    Container(
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
}
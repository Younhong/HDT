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
        backgroundColor: Colors.red,
        title: Text('개설 시간표 조회'),
        centerTitle: true,
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
                    Text(widget.data[index]['prof_name']),
                    Text(widget.data[index]['section'].toString()),
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
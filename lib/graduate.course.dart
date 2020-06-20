import 'package:flutter/material.dart';

class GraduateCoursePage extends StatefulWidget {
  final course, title;

  GraduateCoursePage(this.course, this.title);

  @override
  _GradCourseState createState() => _GradCourseState();
}

class _GradCourseState extends State<GraduateCoursePage> {
  _GradCourseState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title,
          style: TextStyle(
              color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.course == null
            ? 0 : widget.course.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(widget.course[index]["title"]),
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Text("학점: " + widget.course[index]['credits'].toString()),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                )
            ),
          );},
      ),
    );
  }
}
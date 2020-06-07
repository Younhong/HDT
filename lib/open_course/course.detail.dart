import 'package:flutter/material.dart';

class CourseDetailPage extends StatefulWidget {
  var data;
  CourseDetailPage(this.data);

  @override
  CourseDetailState createState() => CourseDetailState();
}

class CourseDetailState extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('개설 시간표 조회'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Text(widget.data['prof_name']),
          Text(widget.data['building'])
        ],
      )
    );
  }
}
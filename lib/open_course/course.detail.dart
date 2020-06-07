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
        title: Text('HGT'),
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
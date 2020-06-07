import 'package:flutter/material.dart';

class CourseInfoPage extends StatefulWidget {
  final List data;
  CourseInfoPage(this.data);

  @override
  CourseInfoState createState() => CourseInfoState();
}

class CourseInfoState extends State<CourseInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView.builder(
        itemCount: widget.data == null
            ? 0 : widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: Row(
              children: <Widget>[
                Text(widget.data[index]["title"]),
                Text(widget.data[index]['prof_name']),
                Text(widget.data[index]['sec_id'].toString()),
              ],
            )
          );},
      ),
    );
  }
}
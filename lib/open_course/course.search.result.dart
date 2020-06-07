import 'package:flutter/material.dart';

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
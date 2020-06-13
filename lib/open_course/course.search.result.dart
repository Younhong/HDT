import 'package:flutter/material.dart';
import 'package:hgt/open_course/course.detail.dart';

class CourseSearchResultPage extends StatefulWidget {
  final List data;
  CourseSearchResultPage(this.data);

  @override
  _CourseSearchResultState createState() => _CourseSearchResultState();
}

class _CourseSearchResultState extends State<CourseSearchResultPage> {
  _CourseSearchResultState();

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
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
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: phoneSize.width * .4,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(widget.data[index]["title"]),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: phoneSize.width * .4,
                          alignment: Alignment.topLeft,
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
                    ),
                    Container(
                      padding: EdgeInsets.only(left: phoneSize.width * .5),
                      alignment: Alignment.topRight,
                      child: Icon(Icons.add),
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
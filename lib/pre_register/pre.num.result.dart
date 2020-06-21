import 'package:flutter/material.dart';
import 'package:hdt/open_course/course.detail.dart';

class PreNumResultPage extends StatefulWidget {
  final List data;
  PreNumResultPage(this.data);

  @override
  _PreNumResultState createState() => _PreNumResultState();
}

class _PreNumResultState extends State<PreNumResultPage> {
  _PreNumResultState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('인원별 검색 결과',
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
        itemCount: widget.data == null
            ? 0 : widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: InkWell(
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
                            SizedBox(width: 13),
                            Text("총인원: " + widget.data[index]['all'].toString()),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  )
              ),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CourseDetailPage(widget.data[index]))
                )},
            ),
          );},
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hgt/review/review.main.dart';

class CourseDetailPage extends StatefulWidget {
  var data;
  CourseDetailPage(this.data);

  @override
  CourseDetailState createState() => CourseDetailState();
}

class CourseDetailState extends State<CourseDetailPage> {

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    print(widget.data);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(widget.data['title'], style: TextStyle(color: Colors.black),),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Text(widget.data['prof_name']),
            Text(widget.data['building']),
            Text(widget.data['time']),
            InkWell(
              child: Container(
                width: phoneSize.width * .7,
                height: phoneSize.height * .07,
                alignment: Alignment.center,
                child: Text("수업 리뷰",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReviewMainPage())),
            ),
          ],
      )
    );
  }
}
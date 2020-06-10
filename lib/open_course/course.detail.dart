import 'package:flutter/material.dart';
import 'package:hgt/review.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseDetailPage extends StatefulWidget {
  var data;
  CourseDetailPage(this.data);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetailPage> {
  List<Review> reviewList = List();
  _CourseDetailState();

  @override
  Widget build(BuildContext context) {
    print(widget.data);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () =>
                Navigator.pop(context),
          ),
          title: Text(
            widget.data['title'],
            style: TextStyle(
                color: Colors.black),),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(widget.data['prof_name']),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(widget.data['building']),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(widget.data['time']),
            ),
            FlatButton(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10, top: 30),
                child: Text("수업 리뷰 보기",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),),
              ),
              onPressed: () =>
                  this.reviewJSON(widget.data['title'], widget.data['prof_name'])
            ),
            Container(
              child: reviewList.isEmpty
                  ? Container()
                  : _buildPanel()
            ),
          ],
      )
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          reviewList[index].isExpanded = !isExpanded;
        });
      },
      children: reviewList.map<ExpansionPanel>((Review review) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(review.headerValue),
            );
          },
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: review.reviews.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        child: ListTile(
                          title: Text(review.reviews[index]['title']),
                        ),
                      );
                    })
              ],
            ),
          ),
          isExpanded: review.isExpanded,
        );
      }).toList(),
    );
  }

  Future<String> reviewJSON(String courseName, String profName) async {
    String url =
        'http://52.14.37.173:5000/review?course_name=' + courseName + '&prof_name=' + profName;
    print(url);
    final response = await http.get(url);

    var res = json.decode(response.body);

    setState(() {
      reviewList = generateReviews(res.length, res);
    });

    return 'Success';
  }

  List<Review> generateReviews(int numberOfItems, List allReviews) {
    return List.generate(numberOfItems, (int index) {
      return Review(
          headerValue: '리뷰 $index',
          reviews: allReviews[index]
      );
    });
  }
}
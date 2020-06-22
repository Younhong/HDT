import 'package:flutter/material.dart';
import 'package:hdt/open_course/review.write.dart';
import 'package:hdt/pre_register/pre.num.result.dart';
import 'package:hdt/pre_register/pre.comp.result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseDetailPage extends StatefulWidget {
  final data;
  CourseDetailPage(this.data);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetailPage> {
  _CourseDetailState();

  List reviewList;
  List preData;
  bool loading = false;

  void initState() {
    super.initState();
    setState(() {
      this.reviewJSON(widget.data['id'].toString(), widget.data['prof_name']);
    });
  }


  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
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
          actions: <Widget>[
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.home),
              onPressed: (){
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReviewWritePage(widget.data))),
          child: Icon(Icons.edit, color: Colors.black,),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration:  BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.grey
                    ),//new Color.fromRGBO(255, 0, 0, 0.0),
                    borderRadius:  BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 200,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(widget.data['title'],style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text('교수명: ' + widget.data['prof_name']),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text('강의실: '+ widget.data['building']),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text('시간: '+widget.data['time']),
                        ),
                      ],
                    ),
                    Expanded(

                      child: Column(
                        children: <Widget>[
                          Container(

                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.black)
                              ),
                              child: Text('인원별 예비 수강') ,
                              onPressed: loading ? null : () async {
                                setState(() {
                                  loading = true;
                                });


                                await searchCourse(
                                    '0', widget.data['title'],
                                    '000', '0', widget.data['prof_name']);
                                setState(() {
                                  loading = false;
                                });

                                await Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PreNumResultPage(preData)));

                              },
                            ),
                          ),
                          Container(
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.black)
                              ),
                              child: Text('경쟁률 예비 수강') ,
                              onPressed: loading ? null : () async {
                                setState(() {
                                  loading = true;
                                });


                                await searchComCourse(
                                    '0', widget.data['title'],
                                    '000', '0', widget.data['prof_name'], 'DESC');
                                setState(() {
                                  loading = false;
                                });

                                await Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PreCompResultPage(preData)));

                              },
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("수업 리뷰",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),),
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () => {
                    reviewJSON(widget.data['id'].toString(), widget.data['prof_name']),
                  },
                )
              ],
            ),
            Divider(thickness: 1),
            reviewList == null
                ? Container()
                : Expanded(
              child: ListView.builder(
                  itemCount: reviewList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: phoneSize.width * .7,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Column(
                                  children: <Widget> [
                                    Container(
                                      padding: EdgeInsets.only(left: 10, top:3, bottom: 3),
                                      alignment: Alignment.topLeft,
                                      child: Text("리뷰 " + (index+1).toString()),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left:10, right:10, bottom: 3, top: 3),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        reviewList[index]['description'],),
                                    ),
                                    Divider(thickness: 1),
                                  ]
                              )
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        )
    );
  }

  Future<String> reviewJSON(String courseName, String profName) async {
    String url =
        'http://52.14.37.173:5000/review?course_id=' + courseName + '&prof_name=' + profName;
    print(url);
    final response = await http.get(url);

    var res = json.decode(response.body);
    setState(() {
      reviewList = res;
    });

    return 'Success';
  }

  Future<String> searchCourse(
      String majorCode, String courseName, String injCode,
      String yearSemester, String profName) async {
    String openTime;
    if(majorCode == '0')
      majorCode = '0';

    if(yearSemester == '0')
      openTime = '';
    else
      openTime = '&openTime=$yearSemester';

    String url = 'http://52.14.37.173:5000/basket?major_code='
        +  majorCode + openTime;

    if (injCode != '000')
      url = url + '&injung_code=' + injCode;
    if (profName != "")
      url = url + '&prof_name=' + profName;
    if (courseName != "")
      url = url + '&course_name=' + courseName;

    print(url);
    final response = await http.get(url);



    setState(() {
      preData = json.decode(response.body);
    });


    return "Success";
  }

  Future<String> searchComCourse(
      String majorCode, String courseName, String injCode,
      String yearSemester, String profName, String order) async {
    String openTime;
    if(majorCode == null)
      majorCode = '0';
    if(yearSemester == '0')
      openTime = '';
    else
      openTime = '&openTime=$yearSemester';

    String url = 'http://52.14.37.173:5000/basket_byC?major_code='
        +  majorCode + openTime + '&order=' + order;

    if (injCode != '000')
      url = url + '&injung_code=' + injCode;
    if (profName != "")
      url = url + '&prof_name=' + profName;
    if (courseName != "")
      url = url + '&course_name=' + courseName;

    print(url);
    final response = await http.get(url);


    setState(() {
      preData = json.decode(response.body);

    });


    return "Success";
  }
}
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
    var phoneSize = MediaQuery.of(context).size;
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text("수업을 클릭하면 세부정보 페이지로 이동합니다"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.data == null
                  ? 0 : widget.data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 140,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: phoneSize.width * .5,
                                  height: 30,
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(widget.data[index]["title"], style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                  width: phoneSize.width * .5,
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Text("교수: " + widget.data[index]['prof_name']),
                                      SizedBox(width: 13),
                                    ],
                                  ),
                                ),
                                Container(
                                    width: phoneSize.width * .5,
                                    padding: EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Text("분반: " + widget.data[index]['section'].toString())
                                ),
                                Container(
                                    width: phoneSize.width * .5,
                                    padding: EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Text("총인원: " + widget.data[index]['all'].toString()),
                                ),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: <Widget>[
                                    Text("1학년: " + widget.data[index]['1st'].toString()),
                                    Text("2학년: " + widget.data[index]['2nd'].toString()),
                                    Text("3학년: " + widget.data[index]['3rd'].toString()),
                                    Text("4학년: " + widget.data[index]['4th'].toString()),
                                    Text("개설: " +widget.data[index]['open'].toString())
                                  ],
                                )),
                          ],
                        ),
                      )
                  ),
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CourseDetailPage(widget.data[index]))
                    )},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class PreCompResultPage extends StatefulWidget {
  final List data;
  PreCompResultPage(this.data);

  @override
  _PreCompResultState createState() => _PreCompResultState();
}

class _PreCompResultState extends State<PreCompResultPage> {
  _PreCompResultState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('경쟁율별 검색 결과', style: TextStyle(color: Colors.black),),
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
                          Text("분반: " + widget.data[index]['sec_id'].toString()),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Text("총인원: " + widget.data[index]['total_stu'].toString()),
                          SizedBox(width: 13),
                          widget.data[index]['competition'] == null
                              ? Text("경쟁률: 0")
                              : Text("경쟁률: " + widget.data[index]['competition'].toString()),
                        ],
                      ),
                    )
                  ],
                )
            ),
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(
//                    builder: (context) =>
//                        CourseDetailPage(widget.data[index]))),
            // 과목명 교수명
          );},
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hdt/open_course/course.detail.dart';

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
    var phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('경쟁률별 검색 결과',
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
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(

                                  width: phoneSize.width * .5,
                                  height: 30,
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 10,top: 5),
                                  child: Text(widget.data[index]["title"]),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: phoneSize.width * .5,
                                  height: 20,
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Text("교수: " + widget.data[index]['prof_name'], overflow: TextOverflow.ellipsis, maxLines: 1,),
                                      SizedBox(width: 13),
                                    ],
                                  ),
                                ),
                                Container(
                                    width: phoneSize.width * .5,
                                    padding: EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Text("분반: " + widget.data[index]['sec_id'].toString())
                                ),
                                Container(
                                  width: phoneSize.width * .5,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Text("총인원: " + widget.data[index]['total_stu'].toString()),
                                      SizedBox(width: 10),
                                      widget.data[index]['competition'] == null
                                          ? Text("경쟁률: 0.0")
                                          : Text("경쟁률: " + widget.data[index]['competition'].toString()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(

                                padding: EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
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
                );},
            ),
          )
        ],
      ),
    );
  }
}
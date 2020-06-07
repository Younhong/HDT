import 'package:flutter/material.dart';
import 'package:hgt/pre_register/pre.course.detail.dart';

class PreSearchResultPage extends StatefulWidget {
  final List data;
  PreSearchResultPage(this.data);

  @override
  PreSearchResultState createState() => PreSearchResultState();
}

class PreSearchResultState extends State<PreSearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('예비수강 조회'),
        centerTitle: true,
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
                    Text(widget.data[index]['prof_name']),
                    Text(widget.data[index]['section'].toString()),
                  ],
                )
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => PreDetailPage(widget.data[index]))),
          );},
      ),
    );
  }
}
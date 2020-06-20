import 'package:flutter/material.dart';

class PreDetailPage extends StatefulWidget {
  final data;
  PreDetailPage(this.data);

  @override
  _PreDetailState createState() => _PreDetailState();
}

class _PreDetailState extends State<PreDetailPage> {
  _PreDetailState();

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('예비수강 조회'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Text(widget.data['prof_name']),
            Text(widget.data['building']),
            Text(widget.data['total_stu'].toString())
          ],
        )
    );
  }
}
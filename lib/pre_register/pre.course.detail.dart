import 'package:flutter/material.dart';

class PreDetailPage extends StatefulWidget {
  var data;
  PreDetailPage(this.data);

  @override
  PreDetailState createState() => PreDetailState();
}

class PreDetailState extends State<PreDetailPage> {
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
            Text(widget.data['building'])
          ],
        )
    );
  }
}
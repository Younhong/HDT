import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReviewWritePage extends StatefulWidget{
  var data;
  ReviewWritePage(this.data);

  _ReviewWritePageState createState() => _ReviewWritePageState();
}

class _ReviewWritePageState extends State<ReviewWritePage> {
  _ReviewWritePageState();

  String review = "";
  final TextEditingController _reviewContentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('리뷰 작성',
            style: TextStyle(
                color: Colors.black),),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          height: 200,
          padding: EdgeInsets.only(left: 30, top: 20, right: 30),
          child: Column(
            children: <Widget>[
              Flexible(
                child: TextField(
                  autocorrect: false,
                  controller: _reviewContentController,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black, fontSize: 16.0),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.red,
                    hintText: "리뷰를 입력해주세요",
                    hintStyle: TextStyle(
                        color: Colors.grey, fontSize: 16.0),),
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () async => {
                  _handleSubmitted(_reviewContentController.text),
                  Navigator.pop(context),
                  await reviewWriteJSON(widget.data['id'].toString(),
                      widget.data['open_id'].toString(), widget.data['prof_name'], review),

                },
              )
            ],
          ),
        )
    );
  }

  Future<String> reviewWriteJSON(String courseId, String openId, String profName, String desc) async {
    String url = 'http://52.14.37.173:5000/writeReview?course_id=' + courseId + "&open_id="+ openId
        + "&prof_name=" + profName + "&desc=" + desc;

    print(url);
    final response = await http.get(url);

    var res = json.decode(response.body);

    setState(() {
    });

    print(res);

    return 'Success';
  }

  _handleSubmitted(String text) {
    _reviewContentController.clear();
    setState(() {
      review = text;
    });
  }

  Future<void> _getOut() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();

    return null;
  }
}
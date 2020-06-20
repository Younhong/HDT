import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReviewWritePage extends StatefulWidget{
  final data;
  ReviewWritePage(this.data);

  _ReviewWritePageState createState() => _ReviewWritePageState();
}

class _ReviewWritePageState extends State<ReviewWritePage> {
  _ReviewWritePageState();

  String review = "";
  final TextEditingController _reviewContentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
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
          width: phoneSize.width * .9,
          padding: EdgeInsets.only(left: 30, top: 20),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 20),
                child: Text("이 수업에 대한 리뷰를 작성해주세요",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),),
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black, width: 1),
                      ),
                      child: TextField(
                        autocorrect: false,
                        controller: _reviewContentController,
                        maxLines: 5,
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
                  ),
                  IconButton(
                    padding: EdgeInsets.only(top: 100),
                    icon: Icon(Icons.edit),
                    onPressed: () async => {
                      _handleSubmitted(_reviewContentController.text),
                      Navigator.pop(context),
                      await reviewWriteJSON(widget.data['id'].toString(),
                          widget.data['open_id'].toString(), widget.data['prof_name'], review),
                    },
                  )
                ],
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
}
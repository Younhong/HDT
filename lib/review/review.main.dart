import 'package:flutter/material.dart';
import 'package:hgt/review/review.body.dart';

class ReviewMainPage extends StatelessWidget {
//  final String name, semester, studentID, major;
  ReviewMainPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReviewBodyPage(),
      appBar: AppBar(
        leading: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,),
            onPressed: () =>
                Navigator.pop(context)),
        backgroundColor: Colors.white,
        title: Text('리뷰 조회',
          style: TextStyle(
              color: Colors.black),),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
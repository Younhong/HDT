import 'package:flutter/material.dart';

class GraduateStandardPage extends StatefulWidget{
  _GraduatePageState createState() => _GraduatePageState();
}

class _GraduatePageState extends State<GraduateStandardPage> {
  _GraduatePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('졸업요건 확인',
          style: TextStyle(
              color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Text("hi")
    );
  }
}
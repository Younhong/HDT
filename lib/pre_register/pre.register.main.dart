import 'package:flutter/material.dart';
import 'package:hgt/hgt.drawer.dart';
import 'package:hgt/pre_register/pre.register.body.dart';

class PreRegisterMainPage extends StatelessWidget {
  final String name, semester, studentID, major;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PreRegisterMainPage(this.name, this.semester, this.studentID, this.major);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreRegisterBodyPage(),
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.menu,
              color: Colors.black,),
            onPressed: () =>
                _scaffoldKey.currentState.openDrawer()),
        backgroundColor: Colors.white,
        title: Text('예비수강 조회',
          style: TextStyle(
              color: Colors.black),),
        centerTitle: true,
      ),
      drawer: HGTDrawer(
          name, semester, studentID, major),
      resizeToAvoidBottomInset: false,
    );
  }
}
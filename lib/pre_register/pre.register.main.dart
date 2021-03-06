import 'package:flutter/material.dart';
import 'package:hdt/hdt.drawer.dart';
import 'package:hdt/pre_register/pre.register.body.dart';

class PreRegisterMainPage extends StatelessWidget {
  final courseData;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PreRegisterMainPage(this.courseData);

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
      drawer: HDTDrawer(courseData),
      resizeToAvoidBottomInset: false,
    );
  }
}
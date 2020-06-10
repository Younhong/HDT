import 'package:flutter/material.dart';
import 'package:hgt/pre_register/pre.comp.dart';
import 'package:hgt/pre_register/pre.stu.num.dart';

class PreRegisterBodyPage extends StatefulWidget{
  _PreRegisterBodyState createState() => _PreRegisterBodyState();
}

class _PreRegisterBodyState extends State<PreRegisterBodyPage> {
  _PreRegisterBodyState();

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: phoneSize.width *.17, top: phoneSize.height * .32),
          child: Row(
            children: <Widget>[
              FlatButton(
                child: Text("인원별 조회",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20),),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PreStuNumPage())),
              ),
              SizedBox(width: 10),
              FlatButton(
                child: Text("경쟁률 조회",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20),),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PreCompPage())),
              )
            ],
          ),
        )

      ],
    );
  }
}
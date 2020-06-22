import 'package:flutter/material.dart';
import 'package:hdt/pre_register/pre.comp.dart';
import 'package:hdt/pre_register/pre.stu.num.dart';

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
        Center(
          child: Container(
            height: phoneSize.height,

            padding: EdgeInsets.only(bottom: 150),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  width: phoneSize.width * .5,
                  height: 70,
                  child: RaisedButton(

                    disabledColor: Colors.white,
                    focusColor: Colors.white,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('인원별 조회',style: TextStyle(fontSize: 20),),
                        SizedBox(width: 20,),
                        Icon(Icons.exit_to_app),
                      ],
                    ),
                    onPressed:  () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PreStuNumPage()));
                    },
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: phoneSize.width * .5,
                  height: 70,
                  child: RaisedButton(

                    disabledColor: Colors.white,
                    focusColor: Colors.white,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('경쟁률 조회',style: TextStyle(fontSize: 20),),
                        SizedBox(width: 20,),
                        Icon(Icons.exit_to_app),
                      ],
                    ),
                    onPressed:  () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PreCompPage()));
                    },
                  ),
                ),

              ],
            ),
          ),
        )

      ],
    );
  }
}
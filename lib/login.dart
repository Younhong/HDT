import 'package:flutter/material.dart';
import 'package:hdt/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hdt/loginInfo.dart';

class LoginPage extends StatefulWidget{
  LoginPage();

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();
  var userData;
  String input;

  bool loading = false;

  List data = List();

  final TextEditingController _studentIDController= new TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(()  {
      this.courseJSON('http://52.14.37.173:5000/majorList');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('로그인',
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
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Text('학번을 이용해 로그인 해주세요.'),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                      width: 100,
                      child: TextField(
                        autofocus: true,
                        autocorrect: false,
                        controller: _studentIDController,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black, fontSize: 16.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.red,
                          hintText: "학번",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 16.0),),
                      )
                  ),
                ),
              ],
            ),
            Divider(thickness: 1.5,),
            SizedBox(height: 50,),
            Container(
              width: 150,
              height: 50,
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
                    Text('로그인',style: TextStyle(fontSize: 20),),
                    SizedBox(width: 20,),
                    Icon(Icons.exit_to_app),
                  ],
                ),
                onPressed: loading? null :  () async {
                  loading = true;
                  _handleSubmitted( _studentIDController.text);
                  await _infoJSON(input);
                  studentID != "" ?
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          HomePage(
                             )))
                      : Container();
                  loading = false;
                },
              ),
            ),

          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Future<String> courseJSON(String url) async {
    final response = await http.get(url);

    userData = json.decode(response.body);

    setState(() {

    });

    print(userData);

    return 'Success';
  }

  void _handleSubmitted(String studentID) {

    setState(() {
      input = _studentIDController.text;
    });
    _studentIDController.clear();
    print(input);
  }

  Future<String> _infoJSON(String userID) async {
    String url =
        'http://52.14.37.173:5000/login?user_id=' + userID;
    print(url);
    final response = await http.get(url);

    userData = json.decode(response.body);
    setState(() {
    });
    print(userData);

    studentID = userData[0]['id'].toString();
    major = userData[0]['major1'].toString();
    major2 = userData[0]['major2'].toString();
    name =userData[0]['name'];
    semester = userData[0]['semester'].toString();
    return 'Success';
  }
}
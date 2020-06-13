import 'package:flutter/material.dart';
import 'package:hgt/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget{
  LoginPage();

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();
  var userData;

  String _selectedDept = "1" ;
  String _selectedDept2 = "1";
  String _name = "";
  String _studentID = "";
  String _semester = "";

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
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                      width: 100,
                      child: TextField(
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
            InkWell(
                child: Text("확인"),
                onTap: () async {
                  _handleSubmitted( _studentIDController.text);
                  await _infoJSON(_studentID);
                  (_studentID != "") ?
                  await Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(
                                  name: _name, semester: _semester, studentID: _studentID, major: _selectedDept, major2: _selectedDept2)))
                      : Container();
                }
            )

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
    _studentIDController.clear();
    setState(() {
      _studentID = studentID;
    });
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

    _studentID = userData[0]['id'].toString();
    _selectedDept = userData[0]['major1'].toString();
    _selectedDept2 = userData[0]['major2'].toString();
    _name =userData[0]['name'];
    _semester = userData[0]['semester'].toString();
    return 'Success';
  }
}
import 'package:flutter/material.dart';
import 'package:hgt/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget{
  String name;
  LoginPage(this.name);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List _deptCategory = List();
  String _selectedDept = "1" ;

  _LoginPageState();

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
          backgroundColor: Colors.red,
          title: Text('로그인 페이지'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Text("이름 입력"),
            Text("학번 읿력"),
            Text("학기 수 입력"),
            Text("전공 입력 (DropDown 으로 수정)"),
            Row(
              children: <Widget>[
                DropdownButton(
                  icon: Icon(Icons.arrow_drop_down),
                  items: _deptCategory.map((major) {
                    return DropdownMenuItem<String>(
                      value: major['major_code'].toString(), child: Text(major['major_name'].toString(),),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      _selectedDept = newValue;
                    });
                    print(newValue);
                  },
                  value: _selectedDept,
                ),
              ],
            ),
            FlatButton(
                child: Text("확인"),
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()));
                }
            )
          ],
        )
    );
  }

  Future<String> courseJSON(String url) async {
    final response =
    await http.get(url);

    var res = json.decode(response.body);

    setState(() {
      _deptCategory = res;
    });

    print(res);

    return 'Success';
  }
}
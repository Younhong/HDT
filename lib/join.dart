import 'package:flutter/material.dart';
import 'package:hgt/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JoinPage extends StatefulWidget{
  JoinPage();

  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  _JoinPageState();

  List _deptCategory = List();
  String _selectedDept = "1" ;
  String _selectedDept2 = "1";
  String _name = "";
  String _studentID = "";
  String _semester = "";

  List data = List();

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _semesterController = new TextEditingController();
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
                        controller: _nameController,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black, fontSize: 16.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.red,
                          hintText: "이름",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 16.0),),
                      )
                  ),
                ),
              ],
            ),
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
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                      width: 100,
                      child: TextField(
                        autocorrect: false,
                        controller: _semesterController,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black, fontSize: 16.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.red,
                          hintText: "학기",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 16.0),),
                      )
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text("1전공", style: TextStyle(fontSize: 15),),
                SizedBox(width: 15,),
                DropdownButton(
                  hint: Text('학부'),
                  icon: Icon(Icons.arrow_drop_down),
                  items: _deptCategory.map((major) {
                    return DropdownMenuItem<String>(
                      value: major['major_code'].toString(),
                      child: Text(major['major_name'].toString(),),
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
            Row(
              children: <Widget>[
                Text("2전공", style: TextStyle(fontSize: 15),),
                SizedBox(width: 15,),
                DropdownButton(
                  hint: Text('학부'),
                  icon: Icon(Icons.arrow_drop_down),
                  items: _deptCategory.map((major) {
                    return DropdownMenuItem<String>(
                      value: major['major_code'].toString(),
                      child: Text(major['major_name'].toString(),),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      _selectedDept2 = newValue;
                    });
                    print(newValue);
                  },
                  value: _selectedDept2,
                ),
              ],
            ),
            InkWell(
                child: Text("확인"),
                onTap: () async {
                  _handleSubmitted(
                      _nameController.text, _semesterController.text, _studentIDController.text);
                  (_name != "" && _semester != "" && _studentID != "") ?
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

    var res = json.decode(response.body);

    setState(() {
      _deptCategory = res;
    });

    print(res);

    return 'Success';
  }

  void _handleSubmitted(String name, String semester, String studentID) {
    _nameController.clear();
    _semesterController.clear();
    _studentIDController.clear();

    setState(() {
      _name = name;
      _semester = semester;
      _studentID = studentID;
    });
  }
}
import 'package:flutter/material.dart';
import 'package:hdt/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hdt/loginInfo.dart';


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
  bool loading = false;
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
        title: Text('회원가입',
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
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                      width: 100,
                      child: TextField(
                        autofocus: true,
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
            Divider(thickness: 1.5  ,),
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
            Divider(thickness: 1.5  ,),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                      width: 100,
                      child: TextField(
                        autofocus: true,
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
            Divider(thickness: 1.5  ,),
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
            Divider(thickness: 1.5  ,),
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
            Divider(thickness: 1.5  ,),
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
                    Text('가입',style: TextStyle(fontSize: 20),),
                    SizedBox(width: 20,),
                    Icon(Icons.exit_to_app),
                  ],
                ),
                onPressed: loading? null :  () async {
                  loading = true;
                  _handleSubmitted(
                      _nameController.text, _semesterController.text, _studentIDController.text);
                  print('working?');
                  await joinJSON(_name, _semester, _studentID, _selectedDept, _selectedDept2);
                  (name != "" && semester != "" && studentID != "") ?
                  await Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
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

    var res = json.decode(response.body);

    setState(() {
      _deptCategory = res;
    });

    print(res);

    return 'Success';
  }

  void _handleSubmitted(String iname, String isemester, String istudentID) {

    setState(() {
      _name = iname;
      _semester = isemester;
      _studentID = istudentID;
    });

  }

  Future<String> joinJSON(String iName, String iSemester, String iStudentID, String iMajor1, String iMajor2) async {
    String url = "http://52.14.37.173:5000/account?user_id="+iStudentID+"&user_name="+iName+"&semester="+iSemester+"&major1="+iMajor1+"&major2="+iMajor2;
    final response = await http.get(url);
    print(response);

    setState(() {
      name = iName;
      studentID = iStudentID;
      major = iMajor1;
      major2 = iMajor2;
      semester = iSemester;
    });
    print(name);
    print(studentID);
    print(major);

    return 'Success';
  }
}
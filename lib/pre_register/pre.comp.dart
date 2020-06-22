import 'package:flutter/material.dart';
import 'package:hdt/pre_register/pre.comp.result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PreCompPage extends StatefulWidget {
  PreCompPage();

  @override
  _PreCompState createState() => _PreCompState();
}

class _PreCompState extends State<PreCompPage> {
  _PreCompState();

  @override
  void initState() {
    super.initState();
    setState(()  {
      this.courseJSON('http://52.14.37.173:5000/majorList');
      this.injungJSON('http://52.14.37.173:5000/injungList');
    });
  }

  List data;
  List _deptCategory = List();
  List _injungCategory = List();
  List<String> _yearCategory = ['전체','2018','2019','2020'];
  List<String> _semesterCategory = ['1', '2', '3', '4'];
  String _selectedDept = "1" ;
  String _selectedInjung = '000';
  String _selectedYear = '2020';
  String _selectedSemester = '1';
  String _courseName = "";
  String _profName = "";
  List<String> _order = ["ASC", "DESC"];
  String _selectedOrder = "DESC";
  bool loading = false;
  final TextEditingController _profController = new TextEditingController();
  final TextEditingController _courseNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () =>
              Navigator.pop(context),
        ),
        title: Text("경쟁률 검색",
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
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, top: 30),
                width: phoneSize.width * .85,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        DropdownButton(
                          value: _selectedYear,
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedYear = newValue;});
                          },
                          items: _yearCategory
                              .map((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                        ),
                        SizedBox(width: 20),
                        DropdownButton(
                          value: _selectedSemester,
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedSemester = newValue;});
                          },
                          items: _semesterCategory
                              .map((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
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
                        Flexible(
                          child: Container(
                              width: 100,
                              child: TextField(
                                autocorrect: false,
                                controller: _courseNameController,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.red,
                                  hintText: "과목명",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16.0),),
                              )
                          ),
                        ),
                        Flexible(
                          child: Container(
                              width: 70,
                              child: TextField(
                                autocorrect: false,
                                controller: _profController,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.red,
                                  hintText: "교수명",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16.0),),
                              )
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        DropdownButton(
                          hint: Text('Option'),
                          value: _selectedInjung,
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String newValue) {
                            setState(() { _selectedInjung = newValue;});
                          },
                          items: _injungCategory.map((injung) {
                            return DropdownMenuItem<String>(
                              value: injung['inj_code'],
                              child: Text(injung['kor']),
                            );
                          }).toList(),
                        ),
                        DropdownButton(
                          hint: Text('Option'),
                          value: _selectedOrder,
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (String newValue) {
                            setState(() { _selectedOrder = newValue;});
                          },
                          items: _order.map((index) {
                            return DropdownMenuItem<String>(
                              value: index,
                              child: Text(index),
                            );
                          }).toList(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(thickness: 3,),
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Column(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 80,
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
                        Text('검 색',style: TextStyle(fontSize: 20),),
                        SizedBox(width: 20,),
                        Icon(Icons.search),
                      ],
                    ),
                    onPressed: loading? null :  () async {
                      loading = true;
                      _handleSubmitted(
                          _courseNameController.text, _profController.text);
                      await searchCourse(
                          _selectedDept, _courseName,
                          _selectedInjung, _selectedYear+_selectedSemester, _profName, _selectedOrder);
                      loading = false;
                      await Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PreCompResultPage(data)));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String courseName, String prof) {
    _courseNameController.clear();
    _profController.clear();
    setState(() {
      _courseName = courseName;
      _profName = prof;
    });

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

  Future<String> injungJSON(String url) async {
    final response = await http.get(url);

    var res = json.decode(response.body);

    setState(() {
      _injungCategory = res;
    });

    print(res);

    return 'Success';
  }

  Future<String> searchCourse(
      String majorCode, String courseName, String injCode,
      String yearSemester, String profName, String order) async {

    String openTime;
    if(yearSemester.length  < 5)
      openTime = '';
    else
      openTime = '&openTime=$yearSemester';

    String url = 'http://52.14.37.173:5000/basket_byC?major_code='
        +  majorCode + openTime + '&order=' + order;

    if (injCode != '000')
      url = url + '&injung_code=' + injCode;
    if (profName != "")
      url = url + '&prof_name=' + profName;
    if (courseName != "")
      url = url + '&course_name=' + courseName;

    print(url);
    final response = await http.get(url);

    data = json.decode(response.body);


    return "Success";
  }
}
import 'package:flutter/material.dart';

class OpenCourseBodyPage extends StatefulWidget{
  _OpenCourseBodyState createState() => _OpenCourseBodyState();
}

class _OpenCourseBodyState extends State<OpenCourseBodyPage> {
  _OpenCourseBodyState();
  List<String> _deptCategory = ['GLS', 'CSEE', 'Law', 'Life Science'];
  List<String> _injungCategory = ['신앙1', '신앙2', '인성1', '인성2', '세계관1', '세계관2'];
  List<String> _yearCategory = ['2019', '2020'];
  List<String> _semesterCategory = ['1', '2', '3', '4'];
  String _selectedDept = "GLS";
  String _selectedInjung = "신앙1";
  String _selectedYear = '2020';
  String _selectedSemester = '1';
  final TextEditingController _profController = new TextEditingController();
  final TextEditingController _courseNameController = new TextEditingController();
  final TextEditingController _courseCodeController = new TextEditingController();
  final TextEditingController _sectionController = new TextEditingController();
  String _profName = "";
  String _courseName = "";
  String _courseCode = "";
  String _section = "";

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, top: 30),
              width: phoneSize.width * .8,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      DropdownButton(
                        value: _selectedYear,
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (String newValue) {
                          setState(() { _selectedYear = newValue;});
                        },
                        items: _yearCategory
                            .map((String category) {
                          return DropdownMenuItem<String>(
                            value: category, child: Text(category),
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 20),
                      DropdownButton(
                        value: _selectedSemester,
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (String newValue) {
                          setState(() { _selectedSemester = newValue;});
                        },
                        items: _semesterCategory
                            .map((String category) {
                          return DropdownMenuItem<String>(
                            value: category, child: Text(category),
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 20),
                      DropdownButton(
                        value: _selectedDept,
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (String newValue) {
                          setState(() { _selectedDept = newValue;});
                        },
                        items: _deptCategory
                            .map((String category) {
                          return DropdownMenuItem<String>(
                            value: category, child: Text(category),
                          );
                        }).toList(),
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
                              style: TextStyle(color: Colors.black, fontSize: 16.0),
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
                          width: 100,
                          child: TextField(
                            autocorrect: false,
                            controller: _courseCodeController,
                            maxLines: 1,
                            style: TextStyle(color: Colors.black, fontSize: 16.0),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.red,
                                hintText: "과목코드",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 16.0),
                                contentPadding: EdgeInsets.only(left: 10, right: 10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                            width: 70,
                            child: TextField(
                              autocorrect: false,
                              controller: _profController,
                              maxLines: 1,
                              style: TextStyle(color: Colors.black, fontSize: 16.0),
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
                      Flexible(
                        child: Container(
                            width: 70,
                            child: TextField(
                              autocorrect: false,
                              controller: _sectionController,
                              maxLines: 1,
                              style: TextStyle(color: Colors.black, fontSize: 16.0),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.red,
                                hintText: "분반",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 16.0),),
                            )
                        ),
                      ),
                      DropdownButton(
                        hint: Text('Option'),
                        value: _selectedInjung,
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (String newValue) {
                          setState(() { _selectedInjung = newValue;});
                        },
                        items: _injungCategory
                            .map((String category) {
                          return DropdownMenuItem<String>(
                            value: category, child: Text(category),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 130),
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (_courseNameController.text.isNotEmpty) && (_courseCodeController.text.isNotEmpty)
                    && (_profController.text.isNotEmpty) && (_sectionController.text.isNotEmpty)
                        ? () => _handleSubmitted(
                      _courseNameController.text, _courseCodeController.text, _profController.text, _sectionController.text)
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          child: Text(_selectedYear + "년도 " +  _selectedSemester + "학기"),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(_selectedDept,)
        ),
        Container(
          alignment: Alignment.center,
          child: Text(_courseName + " " + _courseCode),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(_profName + " " + _section),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(_selectedInjung),
        ),
      ],
    );
  }

  Widget _handleSubmitted(String courseName, String courseCode, String prof, String sec) {
    _courseNameController.clear();
    _courseCodeController.clear();
    _profController.clear();
    _sectionController.clear();
    setState(() {
      _courseName = courseName;
      _courseCode = courseCode;
      _profName = prof;
      _section = sec;
    });

    return null;
  }
}
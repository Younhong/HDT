import 'package:flutter/material.dart';
import 'package:hdt/student.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecommendPageBodyPage extends StatefulWidget{
  final String major;
  RecommendPageBodyPage(this.major);

  _RecommendPageBodyState createState() => _RecommendPageBodyState();
}

class _RecommendPageBodyState extends State<RecommendPageBodyPage> {
  _RecommendPageBodyState();

  List<String> _currSemesterCategory = ['1', '2', '3', '4', '5', '6', '7', '8'];

  @override
  void initState() {
    super.initState();
    setState(()  {

    });
  }

  List<Student> recommendList = List();
  String _selectedSemester = '1';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 40, top: 20),
                  child: DropdownButton(
                    value: _selectedSemester,
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (String newValue) {
                      setState(() {
                        _selectedSemester = newValue;});
                    },
                    items: _currSemesterCategory
                        .map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category,
                          style: TextStyle(fontSize: 20),),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 22,left: 10),
                  child: Container(
                    width: 100,
                    height: 30,
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
                          Text('검 색',style: TextStyle(fontSize: 15),),
                          SizedBox(width: 10,),
                          Icon(Icons.search),
                        ],
                      ),
                      onPressed: () async {
                        this.recommendJSON(widget.major, _selectedSemester);
                      },
                    ),
                  )
                )
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: recommendList.isEmpty
                  ? EdgeInsets.only(left: 40, top: 20)
                  : EdgeInsets.only(top: 20),
              child: recommendList.isEmpty
                  ? Text("재학중인 학기를 선택해주세요")
                  : _buildPanel(),
            ),
          ],
        )
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          recommendList[index].isExpanded = !isExpanded;
        });
      },
      children: recommendList.map<ExpansionPanel>((Student student) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(student.headerValue),
            );
          },
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: student.courses.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        child: ListTile(
                          title: Text(student.courses[index]['title']),
                        ),
                      );
                    })
              ],
            ),
          ),
          isExpanded: student.isExpanded,
        );
      }).toList(),
    );
  }

  Future<String> recommendJSON(String majorCode, String semester) async {
    String url =
        'http://52.14.37.173:5000/recommend?major_code=' + majorCode + '&semester=' + semester;
    final response = await http.get(url);
    print(url);

    var res = json.decode(response.body);

    setState(() {
      recommendList = generateStudents(res.length, res);
    });

    return 'Success';
  }

  List<Student> generateStudents(int numberOfItems, List allStudents) {
    return List.generate(numberOfItems, (int index) {
      return Student(
          headerValue: '학생 $index',
          courses: allStudents[index]
      );
    });
  }
}
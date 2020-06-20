import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GraduatePage extends StatefulWidget {
  @override
  _GraduatePageState createState() => _GraduatePageState();
}

class _GraduatePageState extends State<GraduatePage> {

  void initState() {
    super.initState();
    setState(() {
      this.myCoursesJSON('21800370');
      this.proGenJSON();
      this.graduateJSON();
    });
  }

  List courseList = List();
  List graduateList = List();

  double faith = 0;
  double leadership = 0;
  double english = 0;
  double bsm = 0;
  double proGen = 0;
  double freeGen = 0;
  double ict = 0;
  double major = 0;

  List<String> faithList = ['W04', 'W07', 'W08', 'W09', 'W15'];
  List<String> leadershipList = ['W05', 'W06', 'W30'];
  List<String> englishList = ['W19', 'W32'];
  List<String> bsmList = ['W29'];
  List<String> freeGenList;
  List<String> proGenList = [];
  List<String> ictList = ['W57'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(40),
            child:
            graduateList.isEmpty?
            CircularProgressIndicator()
                :
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: ListTile(title: Text('신앙 및 세계관: $faith / ${graduateList[0]['faith']}', style: TextStyle(color: checkSatisfy(faith, graduateList[0]['faith'])),),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      child: Text('과목 조회', style: TextStyle(color: Colors.black),),
                      onPressed: (){

                      },
                    ),
                  ),
                ),
                Card(
                  child: ListTile(title: Text('인성 및 리더십: $leadership / ${graduateList[0]['leadership']}', style: TextStyle(color: checkSatisfy(faith, graduateList[0]['leadership'])),),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      child: Text('과목 조회', style: TextStyle(color: Colors.black),),
                      onPressed: (){

                      },
                    ),
                  ),
                ),
                Card(
                  child: ListTile(title: Text('실무 영어: $english / ${graduateList[0]['english']}', style: TextStyle(color: checkSatisfy(faith, graduateList[0]['english'])),),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      child: Text('과목 조회', style: TextStyle(color: Colors.black),),
                      onPressed: (){

                      },
                    ),
                  ),
                ),
                Card(
                  child: ListTile(title: Text('BSM: $bsm / ${graduateList[0]['BSM']}', style: TextStyle(color: checkSatisfy(faith, graduateList[0]['BSM'])),),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      child: Text('과목 조회', style: TextStyle(color: Colors.black),),
                      onPressed: (){

                      },
                    ),
                  ),
                ),
                Card(
                  child : ListTile(title: Text('ICT 융합 기초: $ict / ${graduateList[0]['ICT']}', style: TextStyle(color: checkSatisfy(faith, graduateList[0]['ICT'])),),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      child: Text('과목 조회', style: TextStyle(color: Colors.black),),
                      onPressed: (){

                      },
                    ),
                  ),
                ),
                Card(
                  child : ListTile(title: Text('전문교양: $proGen / ${graduateList[0]['pro_gen']}', style: TextStyle(color: checkSatisfy(faith, graduateList[0]['pro_gen'])),),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      child: Text('과목 조회', style: TextStyle(color: Colors.black),),
                      onPressed: (){

                      },
                    ),
                  ),
                ),
                Card(
                  child: ListTile(title: Text('자유선택: $freeGen / ${graduateList[0]['free_gen']}', style: TextStyle(color: checkSatisfy(faith, graduateList[0]['free_gen'])),),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      child: Text('과목 조회', style: TextStyle(color: Colors.black),),
                      onPressed: (){

                      },
                    ),
                  ),
                ),
                Card(
                  child: ListTile(title: Text('전공: $major / ${graduateList[0]['major']}', style: TextStyle(color: checkSatisfy(faith, graduateList[0]['major'])),),
                    trailing: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      child: Text('과목 조회', style: TextStyle(color: Colors.black),),
                      onPressed: (){

                      },
                    ),
                  ),
                ),

              ],
            ),

          ),
        ),
      ),

    );
  }

  Future<String> myCoursesJSON(String hakbun) async {

    String url = 'http://52.14.37.173:5000/my_courses?hakbun=$hakbun';
    final response =
    await http.get(url);

    var res = json.decode(response.body);

    setState(() {
      courseList = res;
    });

    for(var course in courseList){
      print(course['title'] + ', inj : ${course['inj_code']}');

      if(course['major_code'] != 1){
        major += course['credits'];
      }

      if(faithList.contains(course['inj_code']))
        setState(() {
          faith += course['credits'];
        });
      else if(leadershipList.contains(course['inj_code']))
        setState(() {
          leadership += course['credits'];
        });
      else if(englishList.contains(course['inj_code']))
        setState(() {
          english += course['credits'];
        });

      else if(bsmList.contains(course['inj_code']))
        setState(() {
          bsm += course['credits'];
        });

      else if(ictList.contains(course['inj_code']))
        setState(() {
          ict += course['credits'];
        });

      else if(proGenList.contains(course['id']))
        setState(() {
          proGen += course['credits'];
        });
      else
        setState(() {
          freeGen += course['credits'];
        });
    }

    return 'Success';
  }

  Future<String> proGenJSON() async {

    String url = 'http://52.14.37.173:5000/progen';
    final response =
    await http.get(url);

    var res = json.decode(response.body);

    setState(() {

      for(var course in res){
        proGenList.add(course['course_id'].toString());
      }
    });

    print(proGenList);

    return 'Success';
  }

  Future<String> graduateJSON() async {

    String url = 'http://52.14.37.173:5000/check';
    final response =
    await http.get(url);

    var res = json.decode(response.body);

    setState(() {
      graduateList = res;
    });

    print(graduateList);


    return 'Success';
  }

  Color checkSatisfy(double curr, int condition ){

    double total = double.parse(condition.toString());
    Color textColor;
    if(curr < total)
      textColor = Colors.red;
    else
      textColor = Colors.blue;

    return textColor;
  }
}
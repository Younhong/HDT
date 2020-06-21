import 'package:flutter/material.dart';
import 'package:hdt/calender/cell.dart';
import 'package:hdt/calender/header.dart';
import 'package:hdt/calender/indicator.dart';
import 'package:hdt/calender/weekly.time.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeeklyTimeTable extends StatefulWidget {
  final ValueChanged<Map<int, List<int>>> onValueChanged;
  final Color cellColor;
  final Color cellSelectedColor;
  final Color boarderColor;
  final Map<int, Map<int, String>> initialSchedule;
  final bool draggable;
  final String locale;
  final String userID, semester;

  WeeklyTimeTable({
    this.cellColor = Colors.white,
    this.cellSelectedColor = Colors.black,
    this.boarderColor = Colors.grey,
    this.initialSchedule = const {
      0: {},
      1: {},
      2: {},
      3: {},
      4: {},
    },
    this.draggable = false,
    this.locale = "en",
    this.onValueChanged,
    this.userID,
    this.semester
  });

  @override
  _WeeklyTimeTableState createState() => _WeeklyTimeTableState(this.initialSchedule);
}

class _WeeklyTimeTableState extends State<WeeklyTimeTable> {
  String locale = 'en';
  Map<int, Map<int, String>> selected;

  _WeeklyTimeTableState(this.selected);

  @override
  void initState() {
    if (WeeklyTimes.localContains(widget.locale)) {
      setState(() {
        locale = widget.locale;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Header(WeeklyTimes.dates[this.locale]),
        SizedBox(height: 20,),
        Expanded(
          child: ListView.builder(
            itemCount: WeeklyTimes.times[this.locale].length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              List<Widget> children = [];
              children.add(Indicator(WeeklyTimes.times[this.locale][index]));
              children.addAll(
                List.generate(
                  WeeklyTimes.dates[this.locale].length - 1,
                      (i) =>
                      Cell(
                        userID: widget.userID,
                        semester: widget.semester,
                        day: i,
                        timeRange: index,
                        isSelected: selected[i].containsKey(index),
                        onCellTapped: onCellTapped,
                        cellColor: widget.cellColor,
                        cellSelectedColor: widget.cellSelectedColor,
                        boarderColor: widget.boarderColor,
                        courseName: selected[i][index],
                      ),
                ),
              );
              return Row(children: children);
            },
          ),
        ),
      ],
    );
  }

  onCellTapped(int day, int timeRange, bool nextSelectedState, String courseName,
      String semester, String userID) {
    setState(() {
      if (!nextSelectedState) {
        //
      } else {
        print("hi");
        deleteCourse(userID, courseName, semester);
      }
    });
  }

  Future<String> deleteCourse(String userID, String courseName, String semester) async {
    String url = 'http://52.14.37.173:5000/delete?user_id='
        +  userID + '&course_name=' + courseName + "&semester="+semester;

    print(url);
    final response = await http.get(url);

    var res = json.decode(response.body);

    setState(() {

    });

    print(res);

    return "Success";
  }
}

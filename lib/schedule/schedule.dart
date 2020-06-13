import 'package:flutter/material.dart';
import 'package:hgt/calender/timetable.dart';

class SchedulePage extends StatefulWidget{
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  _SchedulePageState();

  @override
  Widget build(BuildContext context) {
    Map<int, List<int>> initialSchedule = {
      0: [0,2],
      1: [3,5],
      2: [3,4],
      3: [0,2],
      4: [3,5],
    };

    return WeeklyTimeTable(
      cellColor: Colors.white,
      cellSelectedColor: Colors.grey,
//        boarderColor: Color.fromRGBO(0,30,255, 1.0),
      initialSchedule: initialSchedule,
      locale: 'ko',
      onValueChanged: (Map<int, List<int>>selected) {
        print(selected);
      },
    );
  }
}
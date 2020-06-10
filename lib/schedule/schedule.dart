import 'package:flutter/material.dart';
import 'package:weekly_timetable/weekly_timetable.dart';

class SchedulePage extends StatefulWidget{
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  _SchedulePageState();

  @override
  Widget build(BuildContext context) {
    Map<int, List<int>> initialSchedule = {
      0: [],
      1: [1,2],
      2: [5,6],
      3: [4,5],
      4: [1,2],
      5: [5,6],
      6: [],
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
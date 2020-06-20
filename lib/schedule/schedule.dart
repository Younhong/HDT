import 'package:flutter/material.dart';
import 'package:hgt/calender/timetable.dart';

class SchedulePage extends StatefulWidget{
  var courseData;
  SchedulePage(this.courseData);

  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  _SchedulePageState();
  int tempIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<int, List<int>> initialSchedule = {
      0: [],
      1: [],
      2: [],
      3: [],
      4: [],
    };

    for (int i = 0; i < widget.courseData.length; i++) {
      for (var element in widget.courseData[i]['time'].split(",")) {
        print(element);

        if ((element[0] + element[1] + element[2]) == "Mon") {
          tempIndex = 0;
        }
        else if ((element[0] + element[1] + element[2]) == "Tue") {
          tempIndex = 1;
        }
        else if ((element[0] + element[1] + element[2]) == "Wed") {
          tempIndex = 2;
        }
        else if ((element[0] + element[1] + element[2]) == "Thu") {
          tempIndex = 3;
        }
        else if ((element[0] + element[1] + element[2]) == "Fri") {
          tempIndex = 4;
        }
        initialSchedule[tempIndex].add(int.parse(element[3]));
      }
    }

    return WeeklyTimeTable(
      cellColor: Colors.white,
      cellSelectedColor: Colors.grey,
      initialSchedule: initialSchedule,
      locale: 'ko',
      onValueChanged: (Map<int, List<int>>selected) {
        print(selected);
      },
    );
  }
}
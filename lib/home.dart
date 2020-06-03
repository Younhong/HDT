import 'package:flutter/material.dart';
import 'package:hgt/schedule.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'H',
                        style: TextStyle(
                            fontSize: 70,
                            color: Colors.red,
                            decorationColor: Colors.white)),
                    TextSpan(
                        text: 'G',
                        style: TextStyle(
                            fontSize: 70,
                            color: Colors.yellow,
                            decorationColor: Colors.white)),
                    TextSpan(
                        text: 'T',
                        style: TextStyle(
                            fontSize: 70,
                            color: Colors.green,
                            decorationColor: Colors.white))
                  ]),
            ),
            SizedBox(height: 50),
            InkWell(
              child: Text("개설 시간표 조회",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold),),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => SchedulePage())),
            ),
            SizedBox(height: 50),
            InkWell(
              child: Text("내 시간표 조회",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold),),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => SchedulePage())),
            ),
            SizedBox(height: 50),
            InkWell(
              child: Text("수업 리뷰 조회",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold),),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => SchedulePage())),
            ),
          ],
        ),
      ),
    );
  }
}
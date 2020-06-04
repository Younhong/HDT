import 'package:flutter/material.dart';
import 'package:hgt/home.dart';
import 'package:hgt/review/review.main.dart';
import 'package:hgt/schedule/schedule.dart';

class MyCoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('HGT'),
        centerTitle: true,
      ),
      body: SchedulePage(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(backgroundImage: AssetImage('asset/profile.jpg'),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Younhong',
                          style: TextStyle(color: Colors.white, fontSize: 19)),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home, color: Colors.black),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()));
                }
            ),
            ListTile(
                title: Text("Search Course"),
                leading: Icon(Icons.search),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => MyCoursePage()));
                }
            ),
            ListTile(
                title: Text("Review"),
                leading: Image.asset('asset/review.png',
                  width: 25, height: 25),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => ReviewMainPage()));
                }
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
//      bottomNavigationBar: BottomNavigationBar(
//        type: BottomNavigationBarType.fixed,
//        backgroundColor: Colors.indigo,
//        unselectedItemColor: Colors.black,
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.alarm),
//            title: Text('Alarm'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.assignment),
//            title: Text('Diary'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.map),
//            title: Text('Result'),
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        selectedItemColor: Colors.white,
//        onTap: _onItemTapped,
//      ),
    );
  }
}
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('HGT'),
        centerTitle: true,
      ),
      body: Text("hi"),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(backgroundImage: NetworkImage(""),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('email',
                          style: TextStyle(color: Colors.white, fontSize: 19)),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home, color: Colors.indigo),
                onTap: () {
                  Navigator.pop(context);
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
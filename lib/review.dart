import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('HGT'),
        centerTitle: true,
      ),
      body: Text("Review Lookup"),
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
    );
  }
}
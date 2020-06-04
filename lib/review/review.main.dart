import 'package:flutter/material.dart';

class ReviewMainPage extends StatefulWidget{
   _ReviewMainPageState createState() => _ReviewMainPageState();
}

class _ReviewMainPageState extends State<ReviewMainPage> {
  _ReviewMainPageState();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            child: FlatButton(
              child: Text("Option"),
              /// TODO::: Implement button action
              /// TODO::: DropDownMenu
              onPressed: null,
            )
        )
      ],
    );
  }
}
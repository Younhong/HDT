import 'package:flutter/material.dart';

class ReviewOptionPage extends StatefulWidget{
  final String option;
  ReviewOptionPage(this.option);

  _ReviewOptionState createState() => _ReviewOptionState();
}

class _ReviewOptionState extends State<ReviewOptionPage> {
  _ReviewOptionState();

  @override
  Widget build(BuildContext context) {
    return Text(widget.option);
  }
}

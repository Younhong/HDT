import 'package:flutter/material.dart';
import 'package:hgt/review/review.option.dart';

class ReviewBodyPage extends StatefulWidget{
   _ReviewBodyState createState() => _ReviewBodyState();
}

class _ReviewBodyState extends State<ReviewBodyPage> {
  _ReviewBodyState();

  List<String> _category = ['Option', 'Course Name', 'Prof Name'];

  String _selected = "Option";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 50),
          child: DropdownButton(
            hint: Text('Option'),
            value: _selected,
            icon: Icon(Icons.arrow_drop_down),
//            iconSize: 24,
//            elevation: 1,
            onChanged: (String newValue) {
              setState(() { _selected = newValue;});
            },
            items: _category
                .map((String category) {
              return DropdownMenuItem<String>(
                value: category, child: Text(category),
              );
            }).toList(),
          ),
        ),
        ReviewOptionPage(_selected),
      ],
    );
  }
}

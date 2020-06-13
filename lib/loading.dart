import 'package:flutter/material.dart';

class LoadingDialog {
  static void onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => new Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(Radius.circular(20))),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new CircularProgressIndicator(
                valueColor:
                new AlwaysStoppedAnimation<Color>(Color(0xffB88E00)),
              ),
              SizedBox(height: 16),
              new Text(
                "Loading",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void dismiss(BuildContext context, Function next) {
    Navigator.pop(context); //pop dialog
    next();
  }
}

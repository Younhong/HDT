import 'package:flutter/material.dart';
import 'package:hdt/home.dart';
import 'package:hdt/splash.dart';
import 'package:hdt/login.dart';

class ShrineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      routes: {
        '/home': (BuildContext context) => LoginPage(),
      },
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) =>
          SplashPage(),
      fullscreenDialog: true,
    );
  }
}

import 'package:boilerplate_flutter_nafanesia/screens/home/home.dart';
import 'package:boilerplate_flutter_nafanesia/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate_flutter_nafanesia/screens/splash_screen/splash_screen.dart';

class Routes {
  //static variables
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';

  // Routes
  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => Login(),
    home: (BuildContext context) => Home(),
  };

  //push
  static void push(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }

  //pop
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  //popAndPush
  static void popAndPush(BuildContext context, String routeName) {
    Navigator.popAndPushNamed(context, routeName);
  }

  //pushReplace
  static void pushReplace(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}

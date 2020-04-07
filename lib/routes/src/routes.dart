import 'package:boilerplate_flutter_nafanesia/routes/src/path_route.dart';
import 'package:boilerplate_flutter_nafanesia/screens/home_screen/home_screen.dart';
import 'package:boilerplate_flutter_nafanesia/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate_flutter_nafanesia/screens/splash_screen/splash_screen.dart';

class Routes {
  // Routes
  static final routes = <String, WidgetBuilder>{
    PathRoute.splash: (BuildContext context) => SplashScreen(),
    PathRoute.login: (BuildContext context) => LoginScreen(),
    PathRoute.home: (BuildContext context) => HomeScreen(),
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

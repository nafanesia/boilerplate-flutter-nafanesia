import 'package:flutter/material.dart';

class MyColors {
  static Color primary = Color(0xffF9B635);
  static Color white = Color(0xffffffff);
  static Color black = Color(0xff000000);
  static Color grey = Color(0xff656565);
  static Color darkGrey = Color(0xff555555);
  static Color lightGrey = Color(0xffF5F5F5);
  static Color lightBlue = Color(0xff47C5FB);
  static Color darkBlue = Color(0xff00569E);
  static Color green = Color(0xffA4C639);
  static Color tosca = Color(0xff39C6A4);

  static LinearGradient getGradient(Color colorStart, Color colorEnd) {
    return LinearGradient(
      colors: [colorStart, colorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}

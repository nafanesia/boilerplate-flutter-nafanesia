import 'package:flutter/material.dart';

class MyColors {
  static const Map<int, Color> orange = const <int, Color>{
    50: const Color(0xFFFCF2E7),
    100: const Color(0xFFF8DEC3),
    200: const Color(0xFFF3C89C),
    300: const Color(0xFFEEB274),
    400: const Color(0xFFEAA256),
    500: const Color(0xFFE69138),
    600: const Color(0xFFE38932),
    700: const Color(0xFFDF7E2B),
    800: const Color(0xFFDB7424),
    900: const Color(0xFFD56217)
  };

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

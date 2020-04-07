import 'package:boilerplate_flutter_nafanesia/constants/my_colors.dart';
import 'package:boilerplate_flutter_nafanesia/constants/my_font_family.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData theme = ThemeData(
    fontFamily: MyFontFamily.roboto,
    brightness: Brightness.light,
    primarySwatch: MaterialColor(MyColors.orange[500].value, MyColors.orange),
//    primaryColor: MyColors.primary,
    primaryColorBrightness: Brightness.light,
//    accentColor: MyColors.primary,
    accentColorBrightness: Brightness.light,
  );
}

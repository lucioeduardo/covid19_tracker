import 'package:flutter/material.dart';

final ThemeData themeLight = ThemeData(
  primaryColor: Color(0xffdcddda),
  primaryColorLight: Color(0xff83867e),
  primaryColorDark: Color(0xffEBE9E7),
  accentColor: Color(0xff231F1C),
  
);

final ThemeData themeDark = ThemeData(
  primaryColor: Color(0xff393e3b),
  primaryColorLight: Color(0xff9C9F98),
  primaryColorDark: Color(0xff231F1C),
  accentColor: Color(0xffEBE9E7),
  canvasColor: Color(0xff393e3b),
);

class ThemeColors{
  const ThemeColors._();
  static const Color success = Colors.green;
  static const Color error = Colors.red;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;
}
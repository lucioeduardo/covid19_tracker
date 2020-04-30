import 'package:flutter/material.dart';


final ThemeData themeLight = ThemeData(
  primaryColor: Color(0xffdcddda),
  primaryColorLight: Color(0xff83867e),
  primaryColorDark: Color(0xffEBE9E7),
  accentColor: Color(0xff231F1C),
  backgroundColor: Color(0xffEBE9E7),
  buttonColor: Color(0xff231F1C),
  secondaryHeaderColor: Color(0xffcfd0cd),
  
);

final ThemeData themeDark = ThemeData(
  primaryColor: Color(0xff393e3b),
  primaryColorLight: Color(0xff9C9F98),
  primaryColorDark: Color(0xff231F1C),
  accentColor: Color(0xffEBE9E7),
  canvasColor: Color(0xff393e3b),
  backgroundColor: Color(0xff231F1C),
  secondaryHeaderColor: Color(0xff2C2F26),
);

final ThemeData themeDracula = ThemeData(
  primaryColor: Color(0xff44475a),
  primaryColorLight: Color(0xffbd93f9),
  primaryColorDark: Color(0xff282a36),
  accentColor: Color(0xfff8f8f2),
  canvasColor: Color(0xff282a36),
  backgroundColor: Color(0xff282a36),
  errorColor: Color(0xffff5555),
  iconTheme: IconThemeData(color: Color(0xfff8f8f2)),
  primaryIconTheme: IconThemeData(color: Color(0xfff8f8f2)),
  accentIconTheme: IconThemeData(color: Color(0xfff8f8f2)),
  buttonTheme: ButtonThemeData(buttonColor: Color(0xfff1fa8c)),
  buttonColor: Color(0xfff1fa8c),
  secondaryHeaderColor: Color(0xff44475a),
);

class ThemeColors{
  const ThemeColors._();
  static const Color success = Colors.green;
  static const Color error = Colors.red;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;
}
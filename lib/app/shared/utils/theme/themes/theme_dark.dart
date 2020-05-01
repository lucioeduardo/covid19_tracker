import 'package:corona_data/app/shared/utils/theme/extra_pallete.dart';
import 'package:corona_data/app/shared/utils/theme/theme_interface.dart';
import 'package:flutter/material.dart';

class ThemeDark extends ITheme {
  
  @override
  ExtraPallete getExtraPallete() {
    return ExtraPallete(
        success: Color(0xff40CA87),
        error: Color(0xffFF5656),
        warning: Color(0xffDBC716),
        info: Colors.blue);
  }

  @override
  ThemeData getThemeData() {
    return ThemeData(
        primaryColor: Color(0xff393e3b),
        primaryColorLight: Color(0xff9C9F98),
        primaryColorDark: Color(0xff231F1C),
        accentColor: Color(0xffEBE9E7),
        canvasColor: Color(0xff393e3b),
        backgroundColor: Color(0xff231F1C),
        secondaryHeaderColor: Color(0xff2C2F26));
  }
}
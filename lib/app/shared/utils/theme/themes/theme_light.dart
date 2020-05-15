import 'package:corona_data/app/shared/utils/theme/extra_pallete.dart';
import 'package:corona_data/app/shared/utils/theme/theme_interface.dart';
import 'package:flutter/material.dart';

class ThemeLight extends ITheme {
  @override
  ExtraPallete getExtraPallete() {
    return ExtraPallete(
        success: Colors.green,
        error: Colors.red,
        warning: Colors.orange,
        info: Colors.blue,
        light: Color(0xffEBE9E7),
        dark: Color(0xff231F1C)
        
        );
  }

  @override
  ThemeData getThemeData() {
    return ThemeData(
        primaryColor: Color(0xffdcddda),
        primaryColorLight: Color(0xff83867e),
        primaryColorDark: Color(0xffEBE9E7),
        accentColor: Color(0xff231F1C),
        backgroundColor: Color(0xffEBE9E7),
        buttonColor: Color(0xff231F1C),
        secondaryHeaderColor: Color(0xffcfd0cd));
  }
}
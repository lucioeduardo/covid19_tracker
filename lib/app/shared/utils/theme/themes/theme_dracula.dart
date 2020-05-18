import 'package:corona_data/app/shared/utils/theme/extra_pallete.dart';
import 'package:corona_data/app/shared/utils/theme/theme_interface.dart';
import 'package:flutter/material.dart';

class ThemeDracula extends ITheme {
  @override
  ExtraPallete getExtraPallete() {
    return ExtraPallete(
      success: Color(0xff50D77B),
      error: Color(0xffff5555),
      warning: Color(0xffEDAB69),
      info: Color(0xff8be9fd),
      light: Color(0xfff8f8f2),
      dark: Color(0xff282a36),
    );
  }

  @override
  ThemeData getThemeData() {
    return ThemeData(
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
  }
}

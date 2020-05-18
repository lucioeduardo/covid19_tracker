import 'package:corona_data/app/shared/utils/theme/extra_pallete.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test(
    "ThemeDark ITheme",
    () {
      ThemeDark theme = ThemeDark();
      expect(
        theme.getThemeData(),
        ThemeData(
          primaryColor: Color(0xff393e3b),
          primaryColorLight: Color(0xff9C9F98),
          primaryColorDark: Color(0xff231F1C),
          accentColor: Color(0xffEBE9E7),
          canvasColor: Color(0xff393e3b),
          backgroundColor: Color(0xff231F1C),
          secondaryHeaderColor: Color(0xff2C2F26),
        ),
      );

      expect(
        theme.getExtraPallete(),
        ExtraPallete(
          success: Color(0xff40CA87),
          error: Color(0xffFF5656),
          warning: Color(0xffDBC716),
          info: Colors.blue,
          light: Color(0xffEBE9E7),
          dark: Color(0xff231F1C)
        ),
      );
    },
  );
}

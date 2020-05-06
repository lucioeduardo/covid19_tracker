import 'package:corona_data/app/shared/utils/theme/extra_pallete.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test(
    "ThemeLight ITheme",
    () {
      ThemeLight themeLight = ThemeLight();
      expect(
        themeLight.getThemeData(),
        ThemeData(
          primaryColor: Color(0xffdcddda),
          primaryColorLight: Color(0xff83867e),
          primaryColorDark: Color(0xffEBE9E7),
          accentColor: Color(0xff231F1C),
          backgroundColor: Color(0xffEBE9E7),
          buttonColor: Color(0xff231F1C),
          secondaryHeaderColor: Color(0xffcfd0cd),
        ),
      );

      expect(
        themeLight.getExtraPallete(),
        ExtraPallete(
            success: Colors.green,
            error: Colors.red,
            warning: Colors.orange,
            info: Colors.blue),
      );
    },
  );
}

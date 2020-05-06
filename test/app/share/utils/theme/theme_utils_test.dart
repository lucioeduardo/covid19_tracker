import 'package:collection/collection.dart';
import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/utils/theme/theme_utils.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_dark.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_dracula.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_light.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:corona_data/app/shared/utils/theme/constants.dart';

main() {
  test("Theme Utils getTheme", () {
    expect(
        ThemeUtils.getTheme(Configuration.defaultThemeKey) is ThemeDark, true);
    expect(ThemeUtils.getTheme(kDarkThemeKey) is ThemeDark, true);
    expect(ThemeUtils.getTheme(kLightThemeKey) is ThemeLight, true);
    expect(ThemeUtils.getTheme(kDraculaThemeKey) is ThemeDracula, true);
  });
  test("Theme Utils getNamesPretty", () {
    expect(
      true,
      const ListEquality().equals(
        [
          "LIGHT",
          "DARK",
          "DRACULA",
        ],
        ThemeUtils.getThemeNamesPretty(),
      ),
    );
  });
}

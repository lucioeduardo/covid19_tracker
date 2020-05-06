import 'package:corona_data/app/shared/utils/theme/themes/theme_dark.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_dracula.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_light.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:corona_data/app/shared/utils/theme/constants.dart';

main() {
  test("Theme Constants", () {
    expect(kLightThemeKey, "light");
    expect(kDarkThemeKey, "dark");
    expect(kDraculaThemeKey, "dracula");

    expect(kThemes[kLightThemeKey] is ThemeLight, true);
    expect(kThemes[kDarkThemeKey] is ThemeDark, true);
    expect(kThemes[kDraculaThemeKey] is ThemeDracula, true);
  });

}

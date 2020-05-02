import 'package:corona_data/app/shared/utils/theme/theme_interface.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_dark.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_dracula.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_light.dart';

const String kLightThemeKey = "light";
const String kDarkThemeKey = "dark";
const String kDraculaThemeKey = "dracula";

final Map<String, ITheme> kThemes = {
    kLightThemeKey: ThemeLight(),
    kDarkThemeKey: ThemeDark(),
    kDraculaThemeKey: ThemeDracula(),
  };


import 'package:corona_data/app/shared/utils/theme/theme_interface.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_dark.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_dracula.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_light.dart';

final Map<String, ITheme> themes = {
  "light": ThemeLight(),
  "dark": ThemeDark(),
  "dracula": ThemeDracula(),
};


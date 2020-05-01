import 'package:corona_data/app/shared/utils/localization/locales/en_us_locale.dart';
import 'package:corona_data/app/shared/utils/localization/locales/pt_br_locale.dart';
import 'package:corona_data/app/shared/utils/localization/localization_interface.dart';
import 'package:corona_data/app/shared/utils/theme/theme_interface.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_dark.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_dracula.dart';
import 'package:corona_data/app/shared/utils/theme/themes/theme_light.dart';
import 'package:flutter/material.dart';

final Map<String, ITheme> themes = {
  "light": ThemeLight(),
  "dark": ThemeDark(),
  "dracula": ThemeDracula(),
};


final Map<String, ILocalization> locales = {
  PTBRLocale.key:PTBRLocale(),
  ENUSLocale.key:ENUSLocale(),
};


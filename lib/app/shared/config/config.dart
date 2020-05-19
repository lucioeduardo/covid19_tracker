import 'package:corona_data/app/shared/utils/localization/constants.dart';
import 'package:corona_data/app/shared/utils/theme/constants.dart';
import 'package:corona_data/app/shared/utils/localization/i18n/base_translation.i18n.dart';


class Configuration{
  static const splashLoadingDuration = Duration(milliseconds: 2500);
  static const initialRoute = "/home";
  
  static final themes = kThemes;
  static const defaultThemeKey = kDarkThemeKey;
  static const defaultLocaleKey=kPTBR;
  static final locales = kLocales;
  static final baseTranslations = kBaseTranslations;

  

  const Configuration._();

  
}


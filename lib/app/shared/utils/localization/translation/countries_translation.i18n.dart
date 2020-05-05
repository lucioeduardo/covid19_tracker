import 'package:corona_data/app/shared/utils/localization/translation/countries/english.dart';
import 'package:corona_data/app/shared/utils/localization/translation/countries/portuguese.dart';
import 'package:i18n_extension/i18n_extension.dart';

final TranslationsByLocale kCountryTranslations = Translations.byLocale("en_us") +
  kCountriesInEnglish+
  kCountriesInPortuguese;

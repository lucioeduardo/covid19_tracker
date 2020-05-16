import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/utils/localization/translation/countries_translation.i18n.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  String get i18n => localize(this, Configuration.baseTranslations * kCountryTranslations);
  String plural(value) => localizePlural(value, this, Configuration.baseTranslations);
}

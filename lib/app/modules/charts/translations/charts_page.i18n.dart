import 'package:corona_data/app/shared/config/config.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Configuration.baseTranslations;

  String get i18n => localize(this, _t);
  String plural(value) => localizePlural(value, this, _t);
}
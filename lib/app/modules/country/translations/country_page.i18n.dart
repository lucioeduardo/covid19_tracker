import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("en_us") +
    {
      "en_us": "Brazil",
      "pt_br": "Brasil",
    };

  String get i18n => localize(this, _t);
}
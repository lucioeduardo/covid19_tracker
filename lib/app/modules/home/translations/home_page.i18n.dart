import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Translations("en_us") +
    {
      "en_us": "Brazil",
      "pt_br": "Brasil",
    }+
    {
      "en_us": "United States",
      "pt_br": "Estados Unidos",
    }+
    {
      "en_us": "Map",
      "pt_br": "Mapa",
    }+
    {
      "en_us": "World",
      "pt_br": "Mundo",
    };

  String get i18n => localize(this, _t);
}
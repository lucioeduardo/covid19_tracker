import 'package:corona_data/app/shared/config/config.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Configuration.baseTranslations +
    {
      "en_us": "Number of deaths",
      "pt_br": "Número de mortes",
    }+
    {
      "en_us": "Recovered patients",
      "pt_br": "Pacientes recuperados",
    }+
    {
      "en_us": "Critically ill patients",
      "pt_br": "Pacientes em estado grave",
    };

  String get i18n => localize(this, _t);
}
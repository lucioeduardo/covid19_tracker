import 'package:corona_data/app/shared/config/config.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Configuration.baseTranslations +
    {
      "en_us": "Settings has been changed.",
      "pt_br": "Configurações alteradas com sucesso.",
    }+
    {
      "en_us": "Dark",
      "pt_br": "Escuro",
    }+
    {
      "en_us": "Light",
      "pt_br": "Claro",
    }+
    {
      "en_us": "Dracula",
      "pt_br": "Drácula",
    };

  String get i18n => localize(this, _t);
}
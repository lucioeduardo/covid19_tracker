import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/utils/localization/constants.dart';
import 'package:corona_data/app/shared/utils/localization/translation/countries_translation.i18n.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {

  static var _t = Configuration.baseTranslations +
    {
      kENUS: "Settings has been changed.",
      kPTBR: "Configurações alteradas com sucesso.",
    }+
    {
      kENUS: "Dark",
      kPTBR: "Escuro",
    }+
    {
      kENUS: "Light",
      kPTBR: "Claro",
    }+
    {
      kENUS: "Dracula",
      kPTBR: "Drácula",
    }+
    {
      kENUS: "Open source app, available on",
      kPTBR: "Apliacão de código aberto, disponível no",
    }+
    {
      kENUS: "Powered by LuciosBrothers",
      kPTBR: "Desenvolvido por LuciosBrothers",
    };

  String get i18n => localize(this, _t * kCountryTranslations);
}
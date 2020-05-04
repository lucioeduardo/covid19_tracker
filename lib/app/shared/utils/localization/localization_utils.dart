import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/utils/localization/localization_interface.dart';

class LocalizationUtils {
  const LocalizationUtils._();
  static ILocalization getLocale(String locale) {
    locale = locale != null ? locale.toLowerCase() : '';

    if (locale == null || locale.isEmpty) {
      return Configuration.locales[Configuration.defaultLocaleKey];
    }

    String lang = Configuration.locales.keys.firstWhere(
        (key) => key.substring(0, 2) == locale.substring(0, 2),
        orElse: () => Configuration.defaultLocaleKey);

    return Configuration.locales[lang];
  }

  static List<String> getLocaleNamesPretty() {
    return Configuration.locales.keys
        .map((name) => name.toUpperCase())
        .toList();
  }
}

import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/utils/localization/locales/pt_br_locale.dart';
import 'package:corona_data/app/shared/utils/localization/localization_interface.dart';

class LocalizationUtils {
  const LocalizationUtils._();
  static ILocalization getLocale(String locale) {
    ILocalization themeInstance;
    locale = locale != null?locale.toLowerCase():'';
    print(locale);
    if(locale == null){
      themeInstance = locales[defaultLocaleKey];
    }
    
    
    else if (locales.containsKey(locale)) {
      themeInstance = locales[locale];
    } else {
      themeInstance = locales[defaultLocaleKey];
    }
    return themeInstance;
  }

  static List<String> getLocaleNamesPretty(){
    print(locales.keys.map((name)=>name.toUpperCase()).toList().toString());
    return locales.keys.map((name)=>name.toUpperCase()).toList();
  }

  static const defaultLocaleKey=PTBRLocale.key;
}
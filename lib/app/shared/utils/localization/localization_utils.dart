import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/utils/localization/locales/pt_br_locale.dart';
import 'package:corona_data/app/shared/utils/localization/localization_interface.dart';

class LocalizationUtils {
  const LocalizationUtils._();
  static ILocalization getLocale(String locale) {
    ILocalization themeInstance;
    locale = locale != null?locale.toLowerCase():'';
    
    if(locale == null){
      themeInstance = Configuration.locales[Configuration.defaultLocaleKey];
    }
    
    
    else if (Configuration.locales.containsKey(locale)) {
      themeInstance = Configuration.locales[locale];
    } else {
      themeInstance = Configuration.locales[Configuration.defaultLocaleKey];
    }
    return themeInstance;
  }

  static List<String> getLocaleNamesPretty(){
    return Configuration.locales.keys.map((name)=>name.toUpperCase()).toList();
  }

  
}
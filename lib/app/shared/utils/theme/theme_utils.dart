import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/utils/theme/constants.dart';
import 'package:corona_data/app/shared/utils/theme/theme_interface.dart';

class ThemeUtils {
  const ThemeUtils._();
  static ITheme getTheme(String themeName) {
    ITheme themeInstance;
    themeName = themeName != null?themeName.toLowerCase():'';
    
    if(themeName == null){
      themeInstance = Configuration.themes[kDarkThemeKey];
      
    }
    
    
    else if (Configuration.themes.containsKey(themeName)) {
      themeInstance = Configuration.themes[themeName];
    } else {
      themeInstance = Configuration.themes[kDarkThemeKey];
    }
    return themeInstance.initialize();
  }

  static List<String> getThemeNamesPretty(){
    return Configuration.themes.keys.map((name)=>name.toUpperCase()).toList();
  }
}
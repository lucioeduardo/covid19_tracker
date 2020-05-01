import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/utils/theme/theme_interface.dart';

class ThemeUtils {
  const ThemeUtils._();
  static ITheme getTheme(String themeName) {
    ITheme themeInstance;
    themeName = themeName != null?themeName.toLowerCase():'';
    
    if(themeName == null){
      themeInstance = themes['dark'];
    }
    
    
    else if (themes.containsKey(themeName)) {
      themeInstance = themes[themeName];
    } else {
      themeInstance = themes['dark'];
    }
    return themeInstance.initialize();
  }

  static List<String> getThemeNamesPretty(){
    return themes.keys.map((name)=>name.toUpperCase()).toList();
  }
}
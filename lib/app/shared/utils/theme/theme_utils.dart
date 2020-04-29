import 'package:corona_data/app/shared/config/config.dart';
import 'package:flutter/material.dart';

class ThemeUtils {
  const ThemeUtils._();
  static ThemeData getThemeData(String theme) {
    if(theme == null){
      return themes['dark'];
    }
    theme=theme.toLowerCase();
    if (themes.containsKey(theme) || theme == null) {
      return themes[theme];
    } else {
      return themes['dark'];
    }
  }

  static List<String> getThemeNamesPretty(){
    return themes.keys.map((name)=>name.toUpperCase()).toList();
  }
}
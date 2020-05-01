import 'package:corona_data/app/shared/utils/theme/extra_pallete.dart';
import 'package:flutter/material.dart';

abstract class ITheme {
  ThemeData themeData;
  ExtraPallete extraPallete;
  
  ThemeData getThemeData();
  ExtraPallete getExtraPallete();

  ITheme initialize(){
    this.themeData = getThemeData();
    this.extraPallete = getExtraPallete();

    return this;
  }
}









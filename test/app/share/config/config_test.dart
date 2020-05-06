import 'package:corona_data/app/shared/utils/localization/constants.dart';
import 'package:corona_data/app/shared/utils/localization/translation/base_translation.i18n.dart';
import 'package:corona_data/app/shared/utils/theme/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:corona_data/app/shared/config/config.dart';
void main() {
  
  test("Configuration attributes", (){
    expect(Configuration.initialRoute, '/home');
    expect(Configuration.splashLoadingDuration, Duration(milliseconds: 2500));
    expect(Configuration.themes, kThemes);
    expect(Configuration.defaultThemeKey, kDarkThemeKey);
    expect(Configuration.defaultLocaleKey, kPTBR);
    expect(Configuration.locales, kLocales);
    expect(Configuration.baseTranslations, kBaseTranslations);
    
  });
}
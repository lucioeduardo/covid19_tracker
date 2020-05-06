import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';

main() {
  
  setUp(() {
    // Modular.get<SplashController>();
  });

   group('TranslationsMissing Test', () {
     test("MissingKeys", (){
        expect(Translations.missingKeys, isEmpty);
        expect(Translations.missingTranslations, isEmpty);
     });
    
    
  });
}

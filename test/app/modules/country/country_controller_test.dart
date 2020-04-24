import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:corona_data/app/modules/country/country_controller.dart';
import 'package:corona_data/app/modules/country/country_module.dart';

void main() {
  initModule(CountryModule());
  // CountryController country;
  //
  setUp(() {
    //     country = CountryModule.to.get<CountryController>();
  });

  group('CountryController Test', () {
    //   test("First Test", () {
    //     expect(country, isInstanceOf<CountryController>());
    //   });

    //   test("Set Value", () {
    //     expect(country.value, equals(0));
    //     country.increment();
    //     expect(country.value, equals(1));
    //   });
  });
}

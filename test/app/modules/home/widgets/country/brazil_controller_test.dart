import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/modules/home/widgets/country/country_controller.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:mockito/mockito.dart';

class CovidRepositoryMock extends Mock implements ICovidRepository {}

void main() {
  initModule(AppModule());

  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();

  when(covidRepositoryMock.countryInfo('brazil')).thenAnswer((_) async => Future.value(
      InfoModel(
          cases: 555,
          deaths: 100,
          affectedCountries: 300,
          critical: 50,
          recovered: 10,
          todayCases: 8,
          todayDeaths: 5)));

  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);
  CountryController country;
  //
  setUp(() {
    Modular.get<AppController>();
    country = HomeModule.to.get();
  });

  group('CountryController Test', () {
    test("Fetching data", () async {
      expect(country.countryInfo.value.cases, 555);
      expect(country.countryInfo.value.affectedCountries, 300);
      expect(country.countryInfo.value.deaths, 100);
      expect(country.countryInfo.value.critical, 50);
      expect(country.countryInfo.value.todayCases, 8);
      expect(country.countryInfo.value.todayDeaths, 5);
      expect(country.countryInfo.value.recovered, 10);
    });
  });
}

import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/country/country_controller.dart';
import 'package:corona_data/app/modules/country/country_module.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/repositories/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:mockito/mockito.dart';
import 'package:mobx/mobx.dart' as mobx;

import '../mocks/covid_repository_mock.dart';

class LocalStorageMock extends Mock implements ILocalStorage {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  LocalStorageMock localStorageMock = LocalStorageMock();
  initModule(AppModule(),changeBinds: [
    Bind<ILocalStorage>((i) => localStorageMock),
  ]);
  
  when(localStorageMock.isThemeDark())
      .thenAnswer((_) async => Future<bool>.value(true));
  when(localStorageMock.getCountry())
      .thenAnswer((_) async => Future.value("Brazil"));

  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();

  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);

  initModule(CountryModule());
  
  CountryController country;
  GlobalSettingsController globalSettingsController;
  //
  
  setUp(() async {
    
    globalSettingsController = Modular.get<GlobalSettingsController>();
    globalSettingsController.init();
    await mobx.asyncWhen((_) => globalSettingsController.isReady);
    country = Modular.get<CountryController>();
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

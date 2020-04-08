import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:corona_data/app/modules/home/widgets/brazil/brazil_controller.dart';
import 'package:corona_data/app/modules/home/home_module.dart';

class CovidRepositoryMock extends Mock implements ICovidRepository {}

void main() {
  initModule(AppModule());

  final CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();
  when(covidRepositoryMock.brazilInfo()).thenAnswer((_) => Future.value(InfoModel(
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
  BrazilController brazil;
  //
  setUp(() {
    brazil = HomeModule.to.get();
  });

  group('BrazilController Test', () {
    test("Fetching data", () async {
      expect(brazil.brazilInfo.value.cases, 555);
      expect(brazil.brazilInfo.value.affectedCountries, 300);
      expect(brazil.brazilInfo.value.deaths, 100);
      expect(brazil.brazilInfo.value.critical, 50);
      expect(brazil.brazilInfo.value.todayCases, 8);
      expect(brazil.brazilInfo.value.todayDeaths, 5);
      expect(brazil.brazilInfo.value.recovered, 10);
    });

  });
}

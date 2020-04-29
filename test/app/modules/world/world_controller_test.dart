import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/world/world_controller.dart';
import 'package:corona_data/app/modules/world/world_module.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:corona_data/app/modules/home/home_module.dart';

import '../mocks/covid_repository_mock.dart';


void main() {
  initModule(AppModule());

  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();

  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);

  initModule(WorldModule());

  WorldController world;

  setUp(() {
    world = Modular.get();
  });

  group('WorldController Test', () {
    test("Fetching data", () async {
      expect(world.worldInfo.value.cases, 555);
      expect(world.worldInfo.value.affectedCountries, 300);
      expect(world.worldInfo.value.deaths, 100);
      expect(world.worldInfo.value.critical, 50);
      expect(world.worldInfo.value.todayCases, 8);
      expect(world.worldInfo.value.todayDeaths, 5);
      expect(world.worldInfo.value.recovered, 10);
    });
  });
}

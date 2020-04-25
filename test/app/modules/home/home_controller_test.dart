import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/country/country_module.dart';
import 'package:corona_data/app/modules/states_map/states_map_module.dart';
import 'package:corona_data/app/modules/world/world_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:corona_data/app/modules/home/home_controller.dart';
import 'package:corona_data/app/modules/home/home_module.dart';

void main() {
  initModule(AppModule());
  initModule(HomeModule());

  HomeController controller;
  setUp(() {
    controller = Modular.get();
  });

  group('HomeController Test', () {
    test("Inicialization", () {
      expect(controller.selectedIndex, 0);
      expect(controller.page.runtimeType, CountryModule().runtimeType);
      expect(controller.title, 'country');
    });

    test("Set Page to World", () {
      controller.setPage(1);

      expect(controller.selectedIndex, 1);
      expect(controller.page.runtimeType, WorldModule().runtimeType);
      expect(controller.title, 'Mundo');
    });
    test("Set Page to Map", () {
      controller.setPage(2);

      expect(controller.selectedIndex, 2);
      expect(controller.page.runtimeType, StatesMapModule().runtimeType);
      expect(controller.title, 'Mapa');
    });

    test("Set Page to Country", () {
      controller.setPage(0);

      expect(controller.selectedIndex, 0);
      expect(controller.page.runtimeType, CountryModule().runtimeType);
      expect(controller.title, 'country');
    });
  });
}

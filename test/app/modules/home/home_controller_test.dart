import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/widgets/country/country_widget.dart';
import 'package:corona_data/app/modules/home/widgets/states_map/states_map_widget.dart';
import 'package:corona_data/app/modules/home/widgets/world/world_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:corona_data/app/modules/home/home_controller.dart';
import 'package:corona_data/app/modules/home/home_module.dart';

void main() {
  initModule(AppModule());
  initModule(HomeModule());
  // HomeController home;
  //
  HomeController controller;
  setUp(() {
    //     home = HomeModule.to.get<HomeController>();
    controller = Modular.get();
  });

  group('HomeController Test', () {
    test("Inicialization", () {
      expect(controller.selectedIndex, 0);
      expect(controller.page.runtimeType, CountryWidget().runtimeType);
      expect(controller.title, 'Brasil');
    });

    test("Set Page to World", () {
      controller.setPage(1);

      expect(controller.selectedIndex, 1);
      expect(controller.page.runtimeType, WorldWidget().runtimeType);
      expect(controller.title, 'Mundo');
    });
    test("Set Page to Map", () {
      controller.setPage(2);

      expect(controller.selectedIndex, 2);
      expect(controller.page.runtimeType, StatesMapWidget().runtimeType);
      expect(controller.title, 'Mapa');
    });

    test("Set Page to Brazil", () {
      controller.setPage(0);

      expect(controller.selectedIndex, 0);
      expect(controller.page.runtimeType, CountryWidget().runtimeType);
      expect(controller.title, 'Brasil');
    });
  });
}

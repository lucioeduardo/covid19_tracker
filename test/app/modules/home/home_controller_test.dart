import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/country/country_module.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_module.dart';
import 'package:corona_data/app/modules/world/world_module.dart';
import 'package:corona_data/app/shared/repositories/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:corona_data/app/modules/home/home_controller.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:mobx/mobx.dart' as mobx;

import '../../mocks/local_storage_mock.dart';

void main() {
  LocalStorageMock covidRepositoryMock = LocalStorageMock();
  initModule(AppModule(),changeBinds: [
    Bind<ILocalStorage>((i) => covidRepositoryMock),
  ]);
  // initModule(HomeModule());
  

  initModule(HomeModule());

  HomeController controller;
  GlobalSettingsController globalSettingsController;

  setUp(() async {
    globalSettingsController = Modular.get<GlobalSettingsController>();
    globalSettingsController.init();
    await mobx.asyncWhen((_) => globalSettingsController.isReady);
    controller = Modular.get();
  });

  group('HomeController Test', () {
    test("Inicialization", () {
      expect(controller.selectedIndex, 0);
      expect(controller.page.runtimeType, CountryModule().runtimeType);
      expect(controller.title, 'BR');
    });

    test("Set Page to World", () {
      controller.setPage(1);

      expect(controller.selectedIndex, 1);
      expect(controller.page.runtimeType, WorldModule().runtimeType);
      expect(controller.title, 'World');
    });
    test("Set Page to Map", () {
      controller.setPage(2);

      expect(controller.selectedIndex, 2);
      expect(controller.page.runtimeType, StatesMapModule().runtimeType);
      expect(controller.title, 'Map');
    });

    test("Set Page to Country", () {
      controller.setPage(0);

      expect(controller.selectedIndex, 0);
      expect(controller.page.runtimeType, CountryModule().runtimeType);
      expect(controller.title, 'BR');
    });
  });
}

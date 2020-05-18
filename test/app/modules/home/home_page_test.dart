import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/country/country_page.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_page.dart';
import 'package:corona_data/app/modules/world/world_page.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:corona_data/app/modules/home/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../mocks/covid_repository_mock.dart';
import '../../mocks/local_storage_mock.dart';

main() {
  LocalStorageMock localStorageMock = LocalStorageMock();
  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();

  initModule(AppModule(), changeBinds: [
    Bind<ILocalStorage>((i) => localStorageMock),
  ]);
  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);

  GlobalSettingsController globalSettingsController;

  setUp(() {
    globalSettingsController = Modular.get<GlobalSettingsController>();
    globalSettingsController.init();
  });

  group('HomePage Tests', () {
    testWidgets('HomePage - Brasil selected', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));

      final titleFinder = find.widgetWithText(AppBar, 'Brazil');

      expect(titleFinder, findsOneWidget);

      final menuFinder = find.byType(CountryPage);
      expect(menuFinder, findsOneWidget);
    });

    testWidgets('HomePage - World selected', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));

      await tester.tap(
        find.byIcon(FontAwesomeIcons.globe),
      );
      await tester.pump();

      final widgetFinder = find.byType(WorldPage);
      expect(widgetFinder, findsOneWidget);

      final titleFinder = find.widgetWithText(AppBar, 'World');
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('HomePage - Statesmap selected', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));

      await tester.tap(
        find.byIcon(FontAwesomeIcons.mapMarked),
      );
      await tester.pump();

      final widgetFinder = find.byType(StatesMapPage);
      expect(widgetFinder, findsOneWidget);

      final titleFinder = find.widgetWithText(AppBar, 'Map');
      expect(titleFinder, findsOneWidget);
    });
  });
}

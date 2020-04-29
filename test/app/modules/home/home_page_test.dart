import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/country/country_page.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_page.dart';
import 'package:corona_data/app/modules/world/world_page.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/repositories/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:corona_data/app/modules/home/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mockito/mockito.dart';

import '../mocks/covid_repository_mock.dart';


class GlobalSettingsControllerMock extends Mock
    implements GlobalSettingsController {}

class LocalStorageMock extends Mock implements ILocalStorage {}

main() {
  LocalStorageMock localStorageMock = LocalStorageMock();

  when(localStorageMock.getCountry())
      .thenAnswer((_) async => Future.value("Brazil"));
  when(localStorageMock.isThemeDark())
      .thenAnswer((_) async => Future<bool>.value(true));
  initModule(AppModule(), changeBinds: [
    // Bind<GlobalSettingsController>((i)=>globalSettingsControllerMock),
    Bind<ILocalStorage>((i) => localStorageMock),
  ]);

  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();

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

      final titleFinder = find.widgetWithText(AppBar, 'Mundo');
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

      final titleFinder = find.widgetWithText(AppBar, 'Mapa');
      expect(titleFinder, findsOneWidget);
    });
  });
}

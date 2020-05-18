import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/country/country_controller.dart';
import 'package:corona_data/app/modules/country/country_module.dart';
import 'package:corona_data/app/modules/country/country_page.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:corona_data/app/shared/widgets/info_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/mockito.dart';

import '../../mocks/covid_repository_mock.dart';
import '../../mocks/local_storage_mock.dart';

main() {
  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();
  LocalStorageMock localStorageMock = LocalStorageMock();

  initModule(AppModule(), changeBinds: [
    Bind<ILocalStorage>((i) => localStorageMock),
  ]);

  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);

  initModule(CountryModule());

  CountryController controller;
  GlobalSettingsController globalSettingsController;
  AnimationController animationController;
  setUp(() async {
    globalSettingsController = Modular.get<GlobalSettingsController>();
    globalSettingsController.init();

    await mobx.asyncWhen((_) => globalSettingsController.isReady);

    controller = Modular.get<CountryController>();
    animationController =
        AnimationController(vsync: TestVSync(), duration: Duration(seconds: 2));
    animationController.value = 0.4;
    
  });

  group('CountryPage Requests', () {
    
    testWidgets('CountryPage - cases', (WidgetTester tester) async {
      await tester.pumpWidget(
          buildTestableWidget(CountryPage(controller: animationController)));

      final tileFinder = find.widgetWithText(Column, 'Total cases');
      expect(find.descendant(of: tileFinder, matching: find.text('555')),
          findsOneWidget);
      expect(find.descendant(of: tileFinder, matching: find.text('8')),
          findsOneWidget);
      
    });

    testWidgets('CountryPage - deaths', (WidgetTester tester) async {
      await tester.pumpWidget(
          buildTestableWidget(CountryPage(controller: animationController)));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Number of deaths');
      expect(find.descendant(of: tileFinder, matching: find.text('100')),
          findsOneWidget);
      expect(find.descendant(of: tileFinder, matching: find.text('(+5)')),
          findsOneWidget);
    });

    testWidgets('CountryPage - critical', (WidgetTester tester) async {
      await tester.pumpWidget(
          buildTestableWidget(CountryPage(controller: animationController)));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Critically ill patients');
      expect(find.descendant(of: tileFinder, matching: find.text('50')),
          findsOneWidget);
    });

    testWidgets('CountryPage - recovered', (WidgetTester tester) async {
      await tester.pumpWidget(
          buildTestableWidget(CountryPage(controller: animationController)));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Recovered patients');
      expect(find.descendant(of: tileFinder, matching: find.text('10')),
          findsOneWidget);
    });
  });

  group('CountryPage Request Error', () {
    setUp(() {
      when(covidRepositoryMock.countryInfo('Brazil'))
          .thenAnswer((_) async => throw 'E');
      controller.fetchCountryInfo();
    });
    testWidgets("Simulating error", (WidgetTester tester) async {
      when(covidRepositoryMock.countryInfo('Brazil'))
          .thenAnswer((_) async => throw 'E');
      await tester.pumpWidget(
          buildTestableWidget(CountryPage(controller: animationController)));

      final btnFinder = find.widgetWithText(FlatButton, 'Try Again');
      expect(btnFinder, findsOneWidget);

      final msgFinder = find.text('We were unable to access the data');
      expect(msgFinder, findsOneWidget);
    });
    testWidgets("Click try again button", (WidgetTester tester) async {
      await tester.pumpWidget(
          buildTestableWidget(CountryPage(controller: animationController)));

      final btnFinder = find.widgetWithText(FlatButton, 'Try Again');
      expect(btnFinder, findsOneWidget);

      when(covidRepositoryMock.countryInfo('Brazil')).thenAnswer((_) async =>
          Future.value(InfoModel(
              cases: 10,
              critical: 5,
              deaths: 3,
              recovered: 1,
              todayCases: 1,
              todayDeaths: 1)));

      controller.fetchCountryInfo();

      await tester.tap(btnFinder);

      await tester.pump();

      final titleFinder = find.text('Total cases');
      expect(titleFinder, findsOneWidget);
    });
  });
}

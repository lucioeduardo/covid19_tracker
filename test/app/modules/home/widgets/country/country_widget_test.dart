import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/modules/home/repositories/local_storage_interface.dart';
import 'package:corona_data/app/modules/home/widgets/country/country_controller.dart';
import 'package:corona_data/app/modules/home/widgets/country/country_widget.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/shared/info_tile_widget.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/mockito.dart';

class CovidRepositoryMock extends Mock implements ICovidRepository {}

class LocalStorageMock extends Mock implements ILocalStorage {}

main() {
  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();
  LocalStorageMock localStorageMock = LocalStorageMock();

  initModule(AppModule(), changeBinds: [
    Bind<ILocalStorage>((i) => localStorageMock),
  ]);

  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);

  when(covidRepositoryMock.countryInfo("Brazil"))
      .thenAnswer((_) async => Future.value(null));
  when(localStorageMock.isThemeDark())
      .thenAnswer((_) async => Future<bool>.value(true));
  when(localStorageMock.getCountry())
      .thenAnswer((_) async => Future.value("Brazil"));

  CountryController controller;
  GlobalSettingsController globalSettingsController;
  setUp(() async {
    globalSettingsController = Modular.get<GlobalSettingsController>();
    globalSettingsController.init();

    await mobx.asyncWhen((_) => globalSettingsController.isReady);

    controller = Modular.get<CountryController>();
  });

  group('CountryWidget Requests', () {
    setUp(() {
      when(covidRepositoryMock.countryInfo("Brazil")).thenAnswer((_) async =>
          Future.value(InfoModel(
              cases: 555,
              deaths: 100,
              affectedCountries: 300,
              critical: 50,
              recovered: 10,
              todayCases: 8,
              todayDeaths: 5)));
      controller.fetchCountryInfo();
    });

    testWidgets('CountryWidget - cases', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(CountryWidget()));

      final tileFinder = find.widgetWithText(InfoTileWidget, 'Número de Casos');
      expect(find.descendant(of: tileFinder, matching: find.text('555')),
          findsOneWidget);
      expect(find.descendant(of: tileFinder, matching: find.text('(+8)')),
          findsOneWidget);
    });

    testWidgets('CountryWidget - deaths', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(CountryWidget()));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Número de Mortes');
      expect(find.descendant(of: tileFinder, matching: find.text('100')),
          findsOneWidget);
      expect(find.descendant(of: tileFinder, matching: find.text('(+5)')),
          findsOneWidget);
    });

    testWidgets('CountryWidget - critical', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(CountryWidget()));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Pacientes em estado grave');
      expect(find.descendant(of: tileFinder, matching: find.text('50')),
          findsOneWidget);
    });

    testWidgets('CountryWidget - recovered', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(CountryWidget()));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Pacientes recuperados');
      expect(find.descendant(of: tileFinder, matching: find.text('10')),
          findsOneWidget);
    });
  });

  group('CountryWidget Request Error', () {
    setUp(() {
      when(covidRepositoryMock.countryInfo('Brazil'))
          .thenAnswer((_) async => throw 'E');
      controller.fetchCountryInfo();
    });
    testWidgets("Simulating error", (WidgetTester tester) async {
      when(covidRepositoryMock.countryInfo('Brazil'))
          .thenAnswer((_) async => throw 'E');
      await tester.pumpWidget(buildTestableWidget(CountryWidget(
        title: 'Brazil',
      )));

      final btnFinder = find.widgetWithText(FlatButton, 'Tentar novamente');
      expect(btnFinder, findsOneWidget);

      final msgFinder = find.text('Não foi possível acessar os dados.');
      expect(msgFinder, findsOneWidget);
    });
    testWidgets("Click try again button", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(CountryWidget()));

      final btnFinder = find.widgetWithText(FlatButton, 'Tentar novamente');
      expect(btnFinder, findsOneWidget);
      when(covidRepositoryMock.countryInfo('Brazil'))
          .thenAnswer((_) async => Future.value(InfoModel()));

      controller.fetchCountryInfo();

      await tester.tap(btnFinder);

      await tester.pump();

      final titleFinder = find.text('Número de Casos');
      expect(titleFinder, findsOneWidget);
    });
  });
}

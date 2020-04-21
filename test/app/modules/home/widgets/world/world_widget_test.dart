import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/modules/home/widgets/world/world_controller.dart';
import 'package:corona_data/app/modules/home/widgets/world/world_widget.dart';
import 'package:corona_data/app/shared/info_tile_widget.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:mockito/mockito.dart';

class CovidRepositoryMock extends Mock implements ICovidRepository {}

main() {
  initModule(AppModule());

  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();
  when(covidRepositoryMock.worldInfo())
      .thenAnswer((_) async => Future.value(null));

  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);

  WorldController controller;

  setUp(() {
    controller = Modular.get<WorldController>();
  });

  group('WorldWidget Requests', () {
    setUp(() {
      when(covidRepositoryMock.worldInfo()).thenAnswer((_) async =>
          Future.value(InfoModel(
              cases: 555,
              deaths: 100,
              affectedCountries: 300,
              critical: 50,
              recovered: 10,
              todayCases: 8,
              todayDeaths: 5)));
      controller.fetchWorldInfo();
    });

    testWidgets('WorldWidget - cases', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(WorldWidget()));

      final tileFinder = find.widgetWithText(InfoTileWidget, 'Número de Casos');
      expect(find.descendant(of: tileFinder, matching: find.text('555')),
          findsOneWidget);
      expect(find.descendant(of: tileFinder, matching: find.text('(+8)')),
          findsOneWidget);
    });

    testWidgets('WorldWidget - deaths', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(WorldWidget()));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Número de Mortes');
      expect(find.descendant(of: tileFinder, matching: find.text('100')),
          findsOneWidget);
      expect(find.descendant(of: tileFinder, matching: find.text('(+5)')),
          findsOneWidget);
    });

    testWidgets('WorldWidget - affected countries', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(WorldWidget()));

      final tileFinder = find.widgetWithText(InfoTileWidget, 'Número de países afetados');
      expect(find.descendant(of: tileFinder, matching: find.text('300')),
          findsOneWidget);
    });

    testWidgets('WorldWidget - critical', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(WorldWidget()));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Pacientes em estado grave');
      expect(find.descendant(of: tileFinder, matching: find.text('50')),
          findsOneWidget);
    });

    testWidgets('WorldWidget - recovered', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(WorldWidget()));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Pacientes recuperados', skipOffstage: false);

      expect(tileFinder, findsOneWidget);
        
      expect(find.descendant(of: tileFinder, matching: find.text('10', skipOffstage: false)),
          findsOneWidget);
    });
  });

  group('WorldWidget Request Error', () {
    setUp(() {
      when(covidRepositoryMock.worldInfo()).thenAnswer((_) async => throw 'E');
      controller.fetchWorldInfo();
    });
    testWidgets("Simulating error", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(WorldWidget()));

      final btnFinder = find.widgetWithText(FlatButton, 'Tentar novamente');
      expect(btnFinder, findsOneWidget);

      final msgFinder = find.text('Não foi possível acessar os dados.');
      expect(msgFinder, findsOneWidget);
    });
    testWidgets("Click try again button", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(WorldWidget()));

      final btnFinder = find.widgetWithText(FlatButton, 'Tentar novamente');
      expect(btnFinder, findsOneWidget);
      when(covidRepositoryMock.worldInfo())
          .thenAnswer((_) async => Future.value(InfoModel()));

      controller.fetchWorldInfo();

      await tester.tap(btnFinder);

      await tester.pump();

      final titleFinder = find.text('Número de Casos');
      expect(titleFinder, findsOneWidget);
    });
  });
}

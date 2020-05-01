import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/world/world_controller.dart';
import 'package:corona_data/app/modules/world/world_module.dart';
import 'package:corona_data/app/modules/world/world_page.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/widgets/info_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/covid_repository_mock.dart';

main() {
  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();

  initModule(AppModule());
  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);
  initModule(WorldModule());

  WorldController controller;
  AnimationController animationController;
  setUp(() {
    controller = Modular.get<WorldController>();
    animationController =
        AnimationController(vsync: TestVSync(), duration: Duration(seconds: 2));
    animationController.value = 0.4;
  });

  group('WorldPage Requests', () {
    testWidgets('WorldPage - cases', (WidgetTester tester) async {
      animationController.value = 0.4;
      await tester.pumpWidget(buildTestableWidget(WorldPage(
        controller: animationController,
      )));

      final tileFinder = find.widgetWithText(Column, 'Número de Casos');
      expect(find.descendant(of: tileFinder, matching: find.text('555')),
          findsOneWidget);
      expect(find.descendant(of: tileFinder, matching: find.text('8')),
          findsOneWidget);
    });

    testWidgets('WorldPage - deaths', (WidgetTester tester) async {
      animationController.value = 0.4;
      await tester.pumpWidget(buildTestableWidget(WorldPage(
        controller: animationController,
      )));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Número de Mortes');
      expect(find.descendant(of: tileFinder, matching: find.text('100')),
          findsOneWidget);
      expect(find.descendant(of: tileFinder, matching: find.text('(+5)')),
          findsOneWidget);
    });

    testWidgets('WorldPage - affected countries', (WidgetTester tester) async {
      animationController.value = 0.4;
      await tester.pumpWidget(buildTestableWidget(WorldPage(
        controller: animationController,
      )));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Número de países afetados');
      expect(find.descendant(of: tileFinder, matching: find.text('300')),
          findsOneWidget);
    });

    testWidgets('WorldPage - critical', (WidgetTester tester) async {
      animationController.value = 0.4;
      await tester.pumpWidget(buildTestableWidget(WorldPage(
        controller: animationController,
      )));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Pacientes em estado grave');
      expect(find.descendant(of: tileFinder, matching: find.text('50')),
          findsOneWidget);
    });

    testWidgets('WorldPage - recovered', (WidgetTester tester) async {
      animationController.value = 0.4;
      await tester.pumpWidget(buildTestableWidget(WorldPage(
        controller: animationController,
      )));

      final tileFinder = find.widgetWithText(
          InfoTileWidget, 'Pacientes recuperados',
          skipOffstage: false);

      expect(tileFinder, findsOneWidget);

      expect(
          find.descendant(
              of: tileFinder, matching: find.text('10', skipOffstage: false)),
          findsOneWidget);
    });
  });

  group('WorldPage Request Error', () {
    setUp(() {
      when(covidRepositoryMock.worldInfo()).thenAnswer((_) async => throw 'E');
      controller.fetchWorldInfo();
    });
    testWidgets("Simulating error", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(WorldPage(
        controller: animationController,
      )));

      final btnFinder = find.widgetWithText(FlatButton, 'Tentar novamente');
      expect(btnFinder, findsOneWidget);

      final msgFinder = find.text('Não foi possível acessar os dados.');
      expect(msgFinder, findsOneWidget);
    });
    testWidgets("Click try again button", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(WorldPage(
        controller: animationController,
      )));

      final btnFinder = find.widgetWithText(FlatButton, 'Tentar novamente');
      expect(btnFinder, findsOneWidget);
      when(covidRepositoryMock.worldInfo())
          .thenAnswer((_) async => Future.value(InfoModel(
              cases: 10,
              critical: 5,
              deaths: 3,
              recovered: 1,
              todayCases: 1,
              todayDeaths: 1)));

      controller.fetchWorldInfo();

      await tester.tap(btnFinder);

      await tester.pump();

      final titleFinder = find.text('Número de Casos');
      expect(titleFinder, findsOneWidget);
    });
  });
}

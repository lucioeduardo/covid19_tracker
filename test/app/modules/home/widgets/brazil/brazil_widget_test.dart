import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/modules/home/widgets/brazil/brazil_controller.dart';
import 'package:corona_data/app/modules/home/widgets/brazil/brazil_widget.dart';
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
  when(covidRepositoryMock.brazilInfo())
      .thenAnswer((_) async => Future.value(null));

  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);

  BrazilController controller;

  setUp(() {
    controller = Modular.get<BrazilController>();
  });

  group('BrazilWidget Requests', () {
    setUp(() {
      when(covidRepositoryMock.brazilInfo()).thenAnswer((_) async =>
          Future.value(InfoModel(
              cases: 555,
              deaths: 100,
              affectedCountries: 300,
              critical: 50,
              recovered: 10,
              todayCases: 8,
              todayDeaths: 5)));
      controller.fetchBrazilInfo();
    });

    testWidgets('BrazilWidget - cases', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(BrazilWidget()));

      final tileFinder = find.widgetWithText(InfoTileWidget, 'Número de Casos');
      expect(find.descendant(of: tileFinder, matching: find.text('555')),
          findsOneWidget);
      expect(find.descendant(of: tileFinder, matching: find.text('(+8)')),
          findsOneWidget);
    });

    testWidgets('BrazilWidget - deaths', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(BrazilWidget()));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Número de Mortes');
      expect(find.descendant(of: tileFinder, matching: find.text('100')),
          findsOneWidget);
      expect(find.descendant(of: tileFinder, matching: find.text('(+5)')),
          findsOneWidget);
    });

    testWidgets('BrazilWidget - critical', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(BrazilWidget()));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Pacientes em estado grave');
      expect(find.descendant(of: tileFinder, matching: find.text('50')),
          findsOneWidget);
    });

    testWidgets('BrazilWidget - recovered', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(BrazilWidget()));

      final tileFinder =
          find.widgetWithText(InfoTileWidget, 'Pacientes recuperados');
      expect(find.descendant(of: tileFinder, matching: find.text('10')),
          findsOneWidget);
    });
  });

  group('BrazilWidget Request Error', () {
    setUp(() {
      when(covidRepositoryMock.brazilInfo()).thenAnswer((_) async => throw 'E');
      controller.fetchBrazilInfo();
    });
    testWidgets("Simulating error", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(BrazilWidget()));

      final btnFinder = find.widgetWithText(FlatButton, 'Tentar novamente');
      expect(btnFinder, findsOneWidget);

      final msgFinder = find.text('Não foi possível acessar os dados.');
      expect(msgFinder, findsOneWidget);
    });
    testWidgets("Click try again button", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(BrazilWidget()));

      final btnFinder = find.widgetWithText(FlatButton, 'Tentar novamente');
      expect(btnFinder, findsOneWidget);
      when(covidRepositoryMock.brazilInfo())
          .thenAnswer((_) async => Future.value(InfoModel()));

      controller.fetchBrazilInfo();

      await tester.tap(btnFinder);

      await tester.pump();

      final titleFinder = find.text('Número de Casos');
      expect(titleFinder, findsOneWidget);
    });
  });
}

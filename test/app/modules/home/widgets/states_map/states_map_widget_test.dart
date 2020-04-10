import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/modules/home/widgets/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/home/widgets/states_map/states_map_widget.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CovidRepositoryMock extends Mock implements ICovidRepository {}

main() {
  initModule(AppModule());

  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();
  when(covidRepositoryMock.getStatesInfo())
      .thenAnswer((_) async => Future.value(null));

  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);

  StatesMapController controller;

  setUp(() {
    controller = Modular.get<StatesMapController>();
  });

  group('StatesMapWidget - Request Success', () {
    setUp(() {
      when(covidRepositoryMock.getStatesInfo()).thenAnswer((_) => Future.value([
            StateModel(confirmed: 10, deaths: 2, state: 'AL'),
            StateModel(confirmed: 15, deaths: 3, state: 'PE'),
          ]));
      controller.fetchMarkers();
    });

    testWidgets("StatesMapWidget has map", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(StatesMapWidget()));

      final indicatorFinder = find.byType(CircularProgressIndicator);

      expect(indicatorFinder, findsOneWidget);
    });
  });

  group('StatesMapWidget Request Error', () {
    setUp(() {
      when(covidRepositoryMock.getStatesInfo())
          .thenAnswer((_) async => throw 'E');
      controller.fetchMarkers();
    });
    testWidgets("Simulating error", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(StatesMapWidget()));

      final btnFinder = find.widgetWithText(FlatButton, 'Tentar novamente');
      expect(btnFinder, findsOneWidget);

      final msgFinder = find.text('Não foi possível acessar os dados.');
      expect(msgFinder, findsOneWidget);
    });
    testWidgets("Click try again button", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(StatesMapWidget()));

      final btnFinder = find.widgetWithText(FlatButton, 'Tentar novamente');
      expect(btnFinder, findsOneWidget);

      when(covidRepositoryMock.getStatesInfo()).thenAnswer((_) => Future.value([
            StateModel(confirmed: 10, deaths: 2, state: 'AL'),
          ]));

      controller.fetchMarkers();

      await tester.tap(btnFinder);

      await tester.pump();

      final indicatorFinder = find.byType(CircularProgressIndicator);

      expect(indicatorFinder, findsOneWidget);
    });
  });
}

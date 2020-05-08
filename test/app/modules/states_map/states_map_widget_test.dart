import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_module.dart';
import 'package:corona_data/app/modules/states_map/states_map_page.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/covid_repository_mock.dart';

main() {
  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();

  initModule(AppModule());
  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);
  initModule(StatesMapModule());

  StatesMapController controller;

  setUp(() {
    controller = Modular.get<StatesMapController>();
  });

  group('StatesMapPage - Request Success', () {
    testWidgets("StatesMapPage has map", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(StatesMapPage()));

      final indicatorFinder = find.byType(FlutterMap);

      expect(indicatorFinder, findsOneWidget);
    });
  });

  group('StatesMapPage Request Error', () {
    setUp(() {
      when(covidRepositoryMock.getStatesInfo())
          .thenAnswer((_) async => throw 'E');
      controller.fetchData();
    });
    testWidgets("Simulating error", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(StatesMapPage()));

      final btnFinder = find.widgetWithText(FlatButton, 'Try Again');
      expect(btnFinder, findsOneWidget);

      final msgFinder = find.text('We were unable to access the data');
      expect(msgFinder, findsOneWidget);
    });
    testWidgets("Click try again button", (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(StatesMapPage()));

      final btnFinder = find.widgetWithText(FlatButton, 'Try Again');
      expect(btnFinder, findsOneWidget);

      when(covidRepositoryMock.getStatesInfo()).thenAnswer((_) => Future.value([
            StateModel(confirmed: 10, deaths: 2, state: 'AL'),
          ]));

      controller.fetchData();

      await tester.tap(btnFinder);

      await tester.pump();

      final indicatorFinder = find.byType(FlutterMap);

      expect(indicatorFinder, findsOneWidget);
    });
  });
}

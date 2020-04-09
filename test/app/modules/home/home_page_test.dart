import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/modules/home/widgets/brazil/brazil_widget.dart';
import 'package:corona_data/app/modules/home/widgets/states_map/states_map_widget.dart';
import 'package:corona_data/app/modules/home/widgets/world/world_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:corona_data/app/modules/home/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'covid_repository_mock.dart';

main() {
  initModule(AppModule());

  final CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();

  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);

  testWidgets('HomePage - Brasil selected', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage()));

    final titleFinder = find.widgetWithText(AppBar, 'Brasil');
    expect(titleFinder, findsOneWidget);

    final menuFinder = find.byType(BrazilWidget);
    expect(menuFinder, findsOneWidget);
  });

  testWidgets('HomePage - World selected', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage()));

    await tester.tap(find.byIcon(FontAwesomeIcons.globe), );
    await tester.pump();

    final widgetFinder = find.byType(WorldWidget);
    expect(widgetFinder, findsOneWidget);
    
    final titleFinder = find.widgetWithText(AppBar, 'Mundo');
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('HomePage - Statesmap selected', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage()));

    await tester.tap(find.byIcon(FontAwesomeIcons.mapMarked), );
    await tester.pump();

    final widgetFinder = find.byType(StatesMapWidget);
    expect(widgetFinder, findsOneWidget);
    
    final titleFinder = find.widgetWithText(AppBar, 'Mapa');
    expect(titleFinder, findsOneWidget);
  });

}

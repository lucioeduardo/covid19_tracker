import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:corona_data/app/modules/charts/widgets/chart_settings/chart_settings_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../helpers/charts_module_init_helper.dart';

main() {
  InitChartsModuleHelper().load();
  testWidgets('ChartSettingsWidget has PupupMenuButton', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Scaffold(body: ChartSettingsWidget())));
    await tester.pumpAndSettle();

    final popupButtonFinder = find.byWidgetPredicate((widget) => widget is PopupMenuButton<String>);
    expect(popupButtonFinder, findsOneWidget);
  });

  testWidgets('ChartSettingsWidget has ellipsisV icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Scaffold(body: ChartSettingsWidget())));
    final iconFinder = find.byIcon(FontAwesomeIcons.ellipsisV);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('Should show options on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Scaffold(body: ChartSettingsWidget())));
    final popupButtonFinder = find.byWidgetPredicate((widget) => widget is PopupMenuButton<String>);

    await tester.tap(popupButtonFinder);

    await tester.pumpAndSettle();

    final casesFinder = find.text('Cases');
    final recoveredFinder = find.text('Recovered');
    final deathsFinder = find.text('Deaths');
    expect(casesFinder, findsOneWidget);
    expect(recoveredFinder, findsOneWidget);
    expect(deathsFinder, findsOneWidget);
  });
}

import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:corona_data/app/modules/charts/widgets/state_chart/state_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import '../../../../../helpers/charts_module_init_helper.dart';

main() {
  InitChartsModuleHelper().load();

  const String stateName = "abc";
  testWidgets('StateChartWidget has ChartsPage', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Scaffold(
        body: StateChartWidget(
      stateName: stateName,
    ))));
    final chartsPageFinder = find.byType(ChartsPage);
    expect(chartsPageFinder, findsOneWidget);
  });
}

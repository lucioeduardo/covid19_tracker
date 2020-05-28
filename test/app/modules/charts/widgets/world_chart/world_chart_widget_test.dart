import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:corona_data/app/modules/charts/widgets/world_chart/world_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import '../../../../../helpers/charts_module_init_helper.dart';

main() {
  InitChartsModuleHelper().load();

  testWidgets('WorldChartWidget has ChartsPage', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(Scaffold(body: WorldChartWidget())));
    final chartsPageFinder = find.byType(ChartsPage);
    expect(chartsPageFinder, findsOneWidget);
  });
}

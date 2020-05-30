import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:corona_data/app/modules/charts/widgets/city_chart/city_chart_widget.dart';

import '../../../../../helpers/charts_module_init_helper.dart';

main() {
  InitChartsModuleHelper().load();

  const String cityName = "abc";
  const String cityCode = "123";
  testWidgets('CityChartWidget has ChartsPage', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Scaffold(
        body: CityChartWidget(
      cityCode: cityCode,
      cityName: cityName,
    ))));
    final chartsPageFinder = find.byType(ChartsPage);
    expect(chartsPageFinder, findsOneWidget);
  });
}

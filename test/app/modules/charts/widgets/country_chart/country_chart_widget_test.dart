import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:corona_data/app/modules/charts/widgets/country_chart/country_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';


import '../../../../../helpers/charts_module_init_helper.dart';

main() {
  InitChartsModuleHelper().load();

  const String countryName = "abc";
  testWidgets('CountryChartWidget has ChartsPage', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Scaffold(
        body: CountryChartWidget(
      countryName: countryName,
    ))));
    final chartsPageFinder = find.byType(ChartsPage);
    expect(chartsPageFinder, findsOneWidget);
  });
}

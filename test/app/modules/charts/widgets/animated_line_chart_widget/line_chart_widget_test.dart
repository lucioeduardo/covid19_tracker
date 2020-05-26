import 'package:corona_data/app/modules/charts/widgets/animated_line_chart_widget/line_chart_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/charts_module_init_helper.dart';

main() {
  InitChartsModuleHelper().load();

  var defaultValues;

  setUp(() {
    defaultValues = {
      "cases": [10, 15, 20, 30, 60],
      "recovered": [0, 5, 10, 15, 20],
      "deaths": [0, 0, 1, 4, 8, 15],
    };
  });

  testWidgets('LineChartWidget has LineChart',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
      LineChartWidget(
        showCases: true,
        showDeaths: true,
        showRecovered: true,
        values: defaultValues,
      ),
    ));
    await tester.pumpAndSettle();

    final lineChartFinder = find.byType(LineChart);

    expect(lineChartFinder, findsOneWidget);
  });
}

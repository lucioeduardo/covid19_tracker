import 'package:corona_data/app/modules/charts/stores/chart_settings_store.dart';
import 'package:corona_data/app/modules/charts/widgets/animated_line_chart_widget/animated_line_chart_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/animated_line_chart_widget/line_chart_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/charts_module_init_helper.dart';

main() {
  InitChartsModuleHelper().load();

  ChartSettingsStore settingsStore;
  var defaultValues;

  setUp(() {
    settingsStore = Modular.get();
    defaultValues = {
      "cases": [10, 15, 20, 30, 60],
      "recovered": [0, 5, 10, 15, 20],
      "deaths": [0, 0, 1, 4, 8, 15],
    };
  });

  testWidgets('AnimatedLineChartWidget has LineChartWidget',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
      AnimatedLineChartWidget(
        settingsStore: settingsStore,
        hasRecoveredData: true,
        values: defaultValues,
      ),
    ));
    await tester.pumpAndSettle();

    final lineChartFinder = find.byType(LineChartWidget);

    expect(lineChartFinder, findsOneWidget);
  });
}

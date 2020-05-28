import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:corona_data/app/modules/charts/widgets/animated_line_chart_widget/animated_line_chart_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/world_chart/world_chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/charts_module_init_helper.dart';

main() {
  InitChartsModuleHelper().load();

  WorldChartController worldChartController;

  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    worldChartController = Modular.get();
  });

  testWidgets('ChartsPage has title', (WidgetTester tester) async {
    const title = "TesteTitulo";

    await binding.setSurfaceSize(Size(720, 1280));

    await tester.pumpWidget(
      buildTestableWidget(Scaffold(
        body: Container(
          height: 700,
          child: ChartsPage(
            controller: worldChartController,
            title: title,
          ),
        ),
      )),
    );
    final titleFinder = find.text(title);
    expect(titleFinder, findsOneWidget);
  });
  testWidgets('ChartsPage has AnimatedLineChartWidget',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(Scaffold(
        body: Container(
          height: 700,
          child: ChartsPage(
            controller: worldChartController,
            title: '',
          ),
        ),
      )),
    );
    final chartFinder = find.byType(AnimatedLineChartWidget);
    expect(chartFinder, findsOneWidget);
  });
}

import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:corona_data/app/modules/charts/interfaces/historical_repository_interface.dart';
import 'package:corona_data/app/modules/charts/widgets/animated_line_chart_widget/animated_line_chart_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/world_chart/world_chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/charts_module_init_helper.dart';
import '../../mocks/historical_repository_mock.dart';

main() {
  HistoricalRepositoryMock historicalRepositoryMock =
      HistoricalRepositoryMock();

  InitChartsModuleHelper().load(changeBinds: [
    Bind<IHistoricalRepository>((i) => historicalRepositoryMock),
  ]);

  const title = "TesteTitulo";

  WorldChartController worldChartController;

  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    worldChartController = Modular.get();
  });

  group('ChartsPage successful request', () {
    testWidgets('ChartsPage has title', (WidgetTester tester) async {
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
  });

  group('ChartsPage Request Error', () {
    setUp(() {
      when(historicalRepositoryMock.getWorldHistoricalData())
          .thenAnswer((_) async => throw 'E');
      worldChartController.fetchGraphData();
    });
    testWidgets("Simulating error", (WidgetTester tester) async {
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

      final btnFinder = find.widgetWithText(FlatButton, 'Try Again');
      expect(btnFinder, findsOneWidget);

      final msgFinder = find.text('We were unable to access the data');
      expect(msgFinder, findsOneWidget);
    });
    testWidgets("Click try again button", (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestableWidget(Scaffold(
          body: Container(
            height: 700,
            child: ChartsPage(
              controller: worldChartController,
              title: title,
              hasRecoveredData: false,
            ),
          ),
        )),
      );

      final btnFinder = find.widgetWithText(FlatButton, 'Try Again');
      expect(btnFinder, findsOneWidget);

      when(historicalRepositoryMock.getWorldHistoricalData())
          .thenAnswer((_) async => Future.value({
                'cases': [1, 2],
                'deaths': [3, 4],
              }));

      worldChartController.fetchGraphData();

      await tester.tap(btnFinder);

      await tester.pump();

      final titleFinder = find.text(title);
      expect(titleFinder, findsOneWidget);
    });
  });
}

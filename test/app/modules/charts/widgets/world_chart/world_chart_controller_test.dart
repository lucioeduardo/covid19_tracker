import 'package:corona_data/app/modules/charts/widgets/world_chart/world_chart_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/charts_module_init_helper.dart';

void main() {
  InitChartsModuleHelper().load();
  WorldChartController worldChartController;
  //
  setUp(() {
    worldChartController = Modular.get();
  });

  group('WorldChartController Test', () {
    test("Is instance of WorldChartController", () {
      expect(worldChartController, isInstanceOf<WorldChartController>());
    });

    test("Fetch graph data", () async {
      worldChartController.fetchGraphData();
      await worldChartController.graphData;

      Map<String, List<int>> graphData = worldChartController.graphData.value;

      expect(graphData['cases'].length, 5);
      expect(graphData['deaths'].length, 5);
    });
  });
}

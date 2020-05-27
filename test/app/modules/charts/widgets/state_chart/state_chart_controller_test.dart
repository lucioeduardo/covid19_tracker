import 'package:corona_data/app/modules/charts/interfaces/historical_repository_interface.dart';
import 'package:corona_data/app/modules/charts/widgets/city_chart/city_chart_controller.dart';
import 'package:corona_data/app/modules/charts/widgets/state_chart/state_chart_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../helpers/charts_module_init_helper.dart';
import '../../../../mocks/historical_repository_mock.dart';

void main() {
  HistoricalRepositoryMock histMock = HistoricalRepositoryMock();
  InitChartsModuleHelper().load(changeBinds: [
    Bind<IHistoricalRepository>((i) => histMock),
  ]);
  StateChartController stateChartController;
  //
  setUp(() {
    stateChartController = Modular.get();
  });

  group('StateChartController Test', () {
    test("Is instance of StateChartController", () {
      expect(stateChartController, isInstanceOf<StateChartController>());
    });

    test("Set state name", () {
      const String state = 'abc';
      stateChartController.setStateName(state);
      expect(stateChartController.state, state);
    });

    test("Fetch graph data", () async {
      stateChartController.fetchGraphData();
      await stateChartController.graphData;

      Map<String, List<int>> graphData = stateChartController.graphData.value;

      expect(graphData['cases'].length, 5);
      expect(graphData['deaths'].length, 5);
    });

    test("Fetch graph data from a custom state", () async {
      const String state = 'abc';
      stateChartController.setStateName(state);

      when(histMock.getStateHistoricalData(state)).thenAnswer(
        (_) async => Future.value({
          'cases': [1,2,3,4],
          'deaths': [2, 3]
        }),
      );

      stateChartController.fetchGraphData();
      await stateChartController.graphData;

      Map<String, List<int>> graphData = stateChartController.graphData.value;

      expect(graphData['cases'].length, 4);
      expect(graphData['deaths'].length, 2);
    });
  });
}

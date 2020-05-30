import 'package:corona_data/app/modules/charts/interfaces/historical_repository_interface.dart';
import 'package:corona_data/app/modules/charts/widgets/city_chart/city_chart_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../helpers/charts_module_init_helper.dart';
import '../../../../mocks/historical_repository_mock.dart';

void main() {
  HistoricalRepositoryMock histMock = HistoricalRepositoryMock();
  InitChartsModuleHelper().load(
    changeBinds: [
      Bind<IHistoricalRepository>((i) => histMock),
    ]
  );
  CityChartController cityChartController;
  //
  setUp(() {
    cityChartController = Modular.get();
  });

  group('CityChartController Test', () {
    test("Is instance of CityChartController", () {
      expect(cityChartController, isInstanceOf<CityChartController>());
    });

    test("Set city code", () {
      const String code = '123';
      cityChartController.setCityCode(code);
      expect(cityChartController.cityCode, code);
    });

    test("Fetch graph data", () async {
      cityChartController.fetchGraphData();
      await cityChartController.graphData;

      Map<String, List<int>> graphData = cityChartController.graphData.value;

      expect(graphData['cases'].length, 5);
      expect(graphData['deaths'].length, 5);
    });

    test("Fetch graph data from a custom city", () async {
      const String code = '123';
      cityChartController.setCityCode(code);

      when(histMock.getCityHistoricalData('123')).thenAnswer(
        (_) async => Future.value({
          'cases' : [1],
          'deaths': [2,3]
        }),
      );
    
      cityChartController.fetchGraphData();
      await cityChartController.graphData;

      Map<String, List<int>> graphData = cityChartController.graphData.value;

      expect(graphData['cases'].length, 1);
      expect(graphData['deaths'].length, 2);
    });
  });
}

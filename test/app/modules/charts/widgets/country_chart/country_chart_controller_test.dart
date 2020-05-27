import 'package:corona_data/app/modules/charts/interfaces/historical_repository_interface.dart';
import 'package:corona_data/app/modules/charts/widgets/country_chart/country_chart_controller.dart';
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
  CountryChartController countryChartController;
  //
  setUp(() {
    countryChartController = Modular.get();
  });

  group('CountryChartController Test', () {
    test("Is instance of CountryChartController", () {
      expect(countryChartController, isInstanceOf<CountryChartController>());
    });

    test("Set country name", () {
      const String country = '123';
      countryChartController.setCountryName(country);
      expect(countryChartController.countryName, country);
    });

    test("Fetch graph data", () async {
      countryChartController.fetchGraphData();
      await countryChartController.graphData;

      Map<String, List<int>> graphData = countryChartController.graphData.value;

      expect(graphData['cases'].length, 5);
      expect(graphData['deaths'].length, 5);
    });

    test("Fetch graph data from a custom country", () async {
      const String country = 'brazil';
      countryChartController.setCountryName(country);

      when(histMock.getCountryHistoricalData(country)).thenAnswer(
        (_) async => Future.value({
          'cases' : [5,5,5],
          'deaths': [1,1,1]
        }),
      );
    
      countryChartController.fetchGraphData();
      await countryChartController.graphData;

      Map<String, List<int>> graphData = countryChartController.graphData.value;

      expect(graphData['cases'].length, 3);
      expect(graphData['deaths'].length, 3);
    });
  });
}

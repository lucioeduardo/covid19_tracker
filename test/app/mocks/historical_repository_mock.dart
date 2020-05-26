import 'package:corona_data/app/modules/charts/repositories/historical_repository_interface.dart';
import 'package:mockito/mockito.dart';

class HistoricalRepositoryMock extends Mock implements IHistoricalRepository {
  HistoricalRepositoryMock() {
    Map<String, List<int>> defaultData = {
      "cases": [10, 15, 20, 30, 60],
      "recovered": [0, 5, 10, 15, 20],
      "deaths": [0, 0, 1, 4, 8, 15],
    };

    Map<String, List<int>> defaultDataWithoutRecovered = {
      "cases": [10, 15, 20, 30, 60],
      "deaths": [0, 0, 1, 4, 8, 15],
    };

    when(this.getCountryHistoricalData(any)).thenAnswer(
      (_) async => Future.value(defaultData),
    );

    when(this.getWorldHistoricalData()).thenAnswer(
      (_) async => Future.value(defaultData),
    );

    when(this.getCityHistoricalData(any)).thenAnswer(
      (_) async => Future.value(defaultDataWithoutRecovered),
    );

    when(this.getStateHistoricalData(any)).thenAnswer(
      (_) async => Future.value(defaultDataWithoutRecovered),
    );
  }
}

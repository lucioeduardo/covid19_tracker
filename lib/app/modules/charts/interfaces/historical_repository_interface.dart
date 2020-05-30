abstract class IHistoricalRepository {
  Future<Map<String, List<int>>> getWorldHistoricalData();

  Future<Map<String, List<int>>> getCountryHistoricalData(String country,
      {int lastdays = 30});

  Future<Map<String, List<int>>> getCityHistoricalData(String cityCode);

  Future<Map<String, List<int>>> getStateHistoricalData(String state);
}

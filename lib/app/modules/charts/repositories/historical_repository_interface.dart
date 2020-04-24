abstract class IHistoricalRepository {
  Future<Map<String, List<int>>> getWorldHistoricalData();

  Future<Map<String, List<int>>> getCountryHistoricalData(String country,
      {int lastdays = 30});
}

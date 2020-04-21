import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoricalRepository extends Disposable {
  final Dio dio;

  HistoricalRepository(this.dio);

  Future<Map<String, List<int>>> _getHistoricalData(dynamic data) async {
    Map<String, List<int>> historicalData = {
      "cases": [],
      "deaths": [],
      "recovered": []
    };

    historicalData.forEach((key, list) {
      data[key].forEach((date, number) {
        list.add(number);
      });
    });

    print(historicalData);

    return historicalData;
  }

  Future<Map<String, List<int>>> getWorldHistoricalData(
      {int lastdays = 30}) async {
    Response response = await dio
        .get('/historical/all', queryParameters: {'lastdays': lastdays});

    return _getHistoricalData(response.data);
  }

  Future<Map<String, List<int>>> getCountryHistoricalData(String country,
      {int lastdays = 30}) async {
    Response response = await dio
        .get('/historical/$country', queryParameters: {'lastdays': lastdays});

    return _getHistoricalData(response.data['timeline']);
  }

  @override
  void dispose() {}
}

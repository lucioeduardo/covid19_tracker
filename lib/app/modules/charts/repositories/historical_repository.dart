import 'dart:math';

import 'package:corona_data/app/modules/charts/repositories/historical_repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoricalRepository extends Disposable implements IHistoricalRepository {
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

  Future<Map<String, List<int>>> getStateHistoricalData(String state) async {
    Response response = await dio.get(
        'https://brasil.io/api/dataset/covid19/caso/data?place_type=state&state=$state');

    Map<String, List<int>> historicalData = {
      "cases": [],
      "deaths": [],
    };

    var data = response.data['results'];

    for (int i = min(29,data.length-1); i >= 0; i--) {
      historicalData['cases'].add(data[i]['confirmed']);
      historicalData['deaths'].add(data[i]['deaths']);
    }

    return historicalData;
  }

  Future<Map<String, List<int>>> getCityHistoricalData(String cityCode) async {
    Response response = await dio.get(
        'https://brasil.io/api/dataset/covid19/caso/data?place_type=city&city_ibge_code=$cityCode');

    Map<String, List<int>> historicalData = {
      "cases": [],
      "deaths": [],
    };

    var data = response.data['results'];

    for(int i=0; i<30-data.length; i++){
      historicalData['cases'].add(0);
      historicalData['deaths'].add(0);
    }

    for (int i = min(29,data.length-1); i >= 0; i--) {
      historicalData['cases'].add(data[i]['confirmed']);
      historicalData['deaths'].add(data[i]['deaths']);
    }
    return historicalData;
  }

  @override
  void dispose() {}
}

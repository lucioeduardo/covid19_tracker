import 'package:corona_data/app/shared/models/city_model.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'covid_repository_interface.dart';

class CovidRepository extends Disposable implements ICovidRepository {
  final Dio dio;

  CovidRepository(this.dio);

  Future<InfoModel> worldInfo() async {
    var response = await dio.get("/all").timeout(Duration(seconds: 5));

    InfoModel info = InfoModel.fromJson(response.data);

    return info;
  }

  Future<InfoModel> countryInfo(String country) async {
    var response =
        await dio.get("/countries/$country").timeout(Duration(seconds: 5));

    InfoModel info = InfoModel.fromJson(response.data);

    return info;
  }

  Future<InfoModel> brazilInfo() async {
    return await countryInfo("Brazil");
  }

  Future<List<StateModel>> getStatesInfo() async {
    var response = await dio
        .get(
            "https://brasil.io/api/dataset/covid19/caso/data?place_type=state&is_last=True")
        .timeout(Duration(seconds: 5));

    List<StateModel> states = List();

    for (var state in response.data['results']) {
      states.add(StateModel.fromJson(state));
    }

    return states;
  }

  Future<List<CityModel>> getCitiesInfo() async {
    // var response = await _getCitiesApi(1);

    List<Response> responses = await Future.wait(
        [_getCitiesApi(1), _getCitiesApi(2), _getCitiesApi(3)]);

    List<CityModel> cities = List();
    for (Response response in responses) {
      for (var city in response.data['results']) {
        cities.add(CityModel.fromJson(city));
      }
    }

    return cities;
  }

  Future<Response> _getCitiesApi(int page) async {
    return await dio
        .get(
            "https://brasil.io/api/dataset/covid19/caso/data?place_type=city&is_last=True&page=$page")
        .timeout(Duration(seconds: 5));
  }

  @override
  void dispose() {}
}

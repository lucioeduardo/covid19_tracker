import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CovidRepository extends Disposable {
  

  final Dio dio;

  CovidRepository(this.dio);

  Future<InfoModel> worldInfo() async {
    var response = await dio.get("/all").timeout(Duration(seconds: 5));

    InfoModel info = InfoModel(
        deaths: response.data['deaths'],
        numCases: response.data['cases'],
        recovered: response.data['recovered']);

    return info;
  }

  Future<InfoModel> countryInfo(String country) async {
    var response =
        await dio.get("/countries/$country").timeout(Duration(seconds: 5));

    InfoModel info = InfoModel(
      critical: response.data['critical'],
      deaths: response.data['deaths'],
      numCases: response.data['cases'],
      recovered: response.data['recovered'],
      todayCases: response.data['todayCases'],
      todayDeaths: response.data['todayDeaths'],
    );

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

  @override
  void dispose() {}
}

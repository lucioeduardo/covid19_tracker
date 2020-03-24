import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:dio/dio.dart';

class CovidRepository{
  final Dio dio;

  CovidRepository(this.dio);

  Future<InfoModel> worldInfo() async{
    var response = await dio.get("/all");

    InfoModel info = InfoModel(
      deaths: response.data['deaths'],
      numCases: response.data['cases'],
      recovered: response.data['recovered']
    );

    return info;
  }

  Future<InfoModel> countryInfo(String country) async{
    var response = await dio.get("/countries/$country");

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

  Future<InfoModel> brazilInfo() async{
    return await countryInfo("Brazil");
  }
}
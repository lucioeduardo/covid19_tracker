
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_pp/app/models/info_model.dart';

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

  @override
  void dispose() {}

  @override
  Future<List<InfoModel>> countriesInfo() async{
    var response = await dio.get("/covid-19/countries").timeout(Duration(seconds: 5));

    List<InfoModel> result = [];

    for(var country in response.data){
      print(country);
      result.add(InfoModel.fromJson(country));
    }

    return result;
  }
}

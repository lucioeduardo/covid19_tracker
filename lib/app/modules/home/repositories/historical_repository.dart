import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoricalRepository extends Disposable{
  
  ////historical/Brazil?lastdays=30
  final Dio dio;

  HistoricalRepository(this.dio);

  Future<List<int>> getWorldHistorical({int lastdays=30}) async{
    Response response = await dio.get('/historical/all', queryParameters: {
      'lastdays':lastdays
    });

    List<int> histList = [];

    response.data['cases'].forEach((data, value) {
      histList.add(value);
    });

    return histList;
  }

  Future<List<int>> getCountryHistorical(String country, {int lastdays=30}) async{
    Response response = await dio.get('/historical/$country', queryParameters: {
      'lastdays':lastdays
    });

    List<int> histList = [];

    response.data['timeline']['cases'].forEach((data, value) {
      histList.add(value);
    });

    return histList;
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
  }

}
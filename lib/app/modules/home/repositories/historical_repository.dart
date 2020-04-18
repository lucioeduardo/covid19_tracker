import 'package:corona_data/app/shared/models/historical_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoricalRepository extends Disposable{
  
  ///historical/all?lastdays=60
  final Dio dio;

  HistoricalRepository(this.dio);

  Future<List<int>> getWorldHistorical(int lastdays) async{
    Response response = await dio.get('/historical/all', queryParameters: {
      'lastdays':lastdays
    });

    List<int> histList = [];

    response.data['cases'].forEach((data, value) {
      histList.add(value);
    });

    return histList;
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
  }

}
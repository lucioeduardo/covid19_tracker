

import 'package:projeto_pp/app/models/info_model.dart';

abstract class ICovidRepository {
  Future<InfoModel> worldInfo();
  Future<InfoModel> countryInfo(String country);
  Future<List<InfoModel>> countriesInfo();
}

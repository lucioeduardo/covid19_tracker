import 'package:corona_data/app/shared/models/city_model.dart';
import 'package:corona_data/app/shared/models/country_model_marker.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/models/state_model.dart';

abstract class ICovidRepository {
  Future<InfoModel> worldInfo();
  Future<InfoModel> brazilInfo();
  Future<InfoModel> countryInfo(String country);
  Future<List<StateModel>> getStatesInfo();
  Future<List<CityModel>> getCitiesInfo();
  Future<List<CountryModelMarker>> getCountriesInfo();
}

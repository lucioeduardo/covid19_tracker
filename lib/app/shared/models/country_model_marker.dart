import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:latlong/latlong.dart';

class CountryModelMarker implements IMarkerModelData{
  int confirmed;
  int deaths;
  LatLng latLng;
  String shortTitle;
  String title;

   CountryModelMarker.fromJson(Map<String, dynamic> json) {
    title = json['country'];
    shortTitle = json['countryInfo']['iso2'];
    
    var lat = json['countryInfo']['lat'];
    var long = json['countryInfo']['long'];
    latLng = LatLng(lat.toDouble(),long.toDouble());

    confirmed = json['cases'];
    deaths = json['deaths'];
  }

  @override
  String get key => null;
}
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
    
    double lat = json['countryInfo']['lat'];
    double long = json['countryInfo']['long'];
    latLng = LatLng(lat,long);

    confirmed = json['cases'];
    deaths = json['deaths'];
  }

  @override
  String get key => null;
}
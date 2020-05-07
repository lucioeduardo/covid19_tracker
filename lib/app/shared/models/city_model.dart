import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/utils/states_cities_coordinates.dart';
import 'package:latlong/latlong.dart';

class CityModel implements IMarkerModelData {
  int confirmed;
  int deaths;
  String city;
  String state;
  String city_ibge_code;

  CityModel({this.confirmed, this.deaths, this.city});

  CityModel.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    city = json['city'];
    state = json['state'];
    city_ibge_code = json['city_ibge_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['city'] = this.city;
    data['state'] = this.state;
    data['city_ibge_code'] = this.city_ibge_code;
    return data;
  }

  @override
  String get title => city;

  @override
  String get key => this.city_ibge_code;

  @override
  LatLng get latLng {
    Map cityTemp;
    try{
      print(this.state);
      cityTemp = kStates[this.state]["cities"][this.key];
      print(cityTemp);
    }catch(Exception){
      return null;
    }
    
    if(cityTemp==null){
      return null;
    }
    print(cityTemp['latitude']);
    return (LatLng(cityTemp['latitude'],cityTemp['longitude']));
  } 
}

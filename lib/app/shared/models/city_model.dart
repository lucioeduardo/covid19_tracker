import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:latlong/latlong.dart';

class CityModel implements IMarkerModelData {
  int confirmed;
  int deaths;
  String city;

  CityModel({this.confirmed, this.deaths, this.city});

  CityModel.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['city'] = this.city;
    return data;
  }

  @override
  String get title => city;

  @override
  String get key => city;

  @override
  // TODO: implement latLng
  LatLng get latLng => null;
}

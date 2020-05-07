import 'package:latlong/latlong.dart';
abstract class IMarkerModelData{

  String get title;
  String get shortTitle;
  int get confirmed;
  int get deaths;
  String get key;
  LatLng get latLng;
  
}
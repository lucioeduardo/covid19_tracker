import 'package:latlong/latlong.dart';
abstract class IMarkerModelData{

  String get title;
  int get confirmed;
  int get deaths;
  String get key;
  LatLng get latLng;
  
}
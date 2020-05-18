
import 'package:latlong/latlong.dart';
abstract class IMarkerModelData{

  String get label;
  String get colorName;
  String get key;
  String get title;
  String get shortTitle;
  
  int get confirmed;
  int get deaths;
  
  LatLng get latLng;
  
}
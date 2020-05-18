import 'dart:math';
import 'package:corona_data/app/modules/states_map/utils/states_map_utils.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';



Map<Marker, IMarkerModelData> createMarkers(
    List<IMarkerModelData> markersData) {
  if (markersData == null) return Map();

  double quartileCases = getFourthQuartileAverage(markersData);
  Map<Marker, IMarkerModelData> markersMap = Map();

  for (IMarkerModelData markerData in markersData) {
    double calc = log(quartileCases / markerData.confirmed);

    Marker marker = markerData.getMarker(Color.lerp(
          Color(0xfff1c40f),
          Color(0xffc0392b),
          1 / max(1, calc),
        ));

    markersMap[marker] = markerData;
    
    
  }
  return markersMap;
}


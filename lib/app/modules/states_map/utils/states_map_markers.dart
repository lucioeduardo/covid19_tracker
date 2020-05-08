import 'dart:math';

import 'package:corona_data/app/modules/states_map/utils/states_map_utils.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

Map<Marker, IMarkerModelData> createMarkers(
      List<IMarkerModelData> markersData, double baseSize) {
    if (markersData == null) return null;

    double quartileCases = getFourthQuartileAverage(markersData);
    Map<Marker, IMarkerModelData> markersMap = Map();

    for (IMarkerModelData markerData in markersData) {
      // double calc = log(maxCases / state.confirmed);
      double calc = log(quartileCases / markerData.confirmed);

      Marker marker = makeMarker(
          markerData,
          Color.lerp(
            Color(0xfff1c40f),
            Color(0xffc0392b),
            1 / max(1, calc),
          ),
          baseSize);

      markersMap[marker] = markerData;
    }

    return markersMap;
  }
Marker makeMarker(IMarkerModelData state, Color color, double baseSize) {
    return Marker(
      width: baseSize,
      height: baseSize,
      point: state.latLng,
      builder: (ctx) => Container(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: baseSize,
            height: baseSize,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 3),
            ),
            child: Container(
              width: baseSize - 10,
              height: baseSize - 10,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Text(
                state.shortTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
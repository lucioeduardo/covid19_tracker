import 'dart:math';

import 'package:corona_data/app/modules/states_map/utils/states_map_utils.dart';
import 'package:corona_data/app/shared/models/country_model_marker.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_svg/flutter_svg.dart';

Map<Marker, IMarkerModelData> createMarkers(
    List<IMarkerModelData> markersData, double baseSize) {
  if (markersData == null) return Map();

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

Marker makeMarker(IMarkerModelData markerData, Color color, double baseSize) {
  bool isAnimate = true;
  return Marker(
      width: baseSize,
      height: baseSize,
      point: markerData.latLng,
      builder: (ctx) {
        Widget tweenMarker = TweenAnimationBuilder(
          duration: Duration(milliseconds: 300 + Random().nextInt(1500)),
          tween: Tween(begin: isAnimate ? 0.0 : 1.0, end: 1.0),
          builder: (_, opacity, __) => Opacity(
            opacity: opacity,
            child: markerData.getMarker(color)
          ),
        );
        isAnimate = false;

        return tweenMarker;
      });
}

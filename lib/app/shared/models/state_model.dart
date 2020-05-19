import 'dart:math';

import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/utils/states_cities_coordinates.dart';
import 'package:corona_data/app/shared/widgets/maps/markers/background/text_background.dart';
import 'package:corona_data/app/shared/widgets/maps/markers/circle_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

const kLabel = "City";
const kColor = "info";
const double kStateBaseSize = 35.0;

class StateModel implements IMarkerModelData {
  int confirmed;
  int deaths;
  String state;

  StateModel({this.confirmed, this.deaths, this.state});

  StateModel.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['state'] = this.state;
    return data;
  }

  @override
  get label => kLabel;

  @override
  String get title => stateName[this.state];

  @override
  String get key => this.state;

  @override
  LatLng get latLng {
    Map stateTemp = kStates[this.state];
    return (LatLng(stateTemp['latitude'], stateTemp['longitude']));
  }

  @override
  String get shortTitle => this.state;

  @override
  String get colorName => kColor;

  @override
  Marker getMarker(Color color) {
    bool hasShowed = false;
    return Marker(
        width: kStateBaseSize,
        height: kStateBaseSize,
        point: this.latLng,
        builder: (ctx) {
          return  CustomCircleMarker(
                  shortTitle: shortTitle,
                  color: color,
                  size: kStateBaseSize,
                  isAnimate: !hasShowed,
                  onEnd: (){
                    hasShowed=true;
                    
                  },
                  child: TextBackgroundMarker(
                    shortTitle: shortTitle,
                  ),
                );
          
        });
        
  }
}

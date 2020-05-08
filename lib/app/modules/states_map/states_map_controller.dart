import 'dart:math';

import 'package:corona_data/app/shared/models/city_model.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mobx/mobx.dart';

part 'states_map_controller.g.dart';

class StatesMapController = _StatesMapControllerBase with _$StatesMapController;

enum MarkersType { states, cities }

abstract class _StatesMapControllerBase with Store {
  final double citieBaseSize = 50.0;
  final int cityClusterMaxRadius = 170;
  final double stateBaseSize = 35.0;
  final int stateClusterMaxRadius = 40;
  final ICovidRepository covidRepository;

  @computed
  Map<Marker, IMarkerModelData> get markers =>
      markerShowed == MarkersType.states ? statesMarkers : citiesMarkers;

  // @computed
  // List<IMarkerModelData> get markersData => markerShowed == MarkersType.states ? statesData.value : citiesData.value;

  @observable
  ObservableFuture<List<StateModel>> statesData;

  @observable
  ObservableFuture<List<CityModel>> citiesData;

  @observable
  MarkersType markerShowed;

  @computed
  Map<Marker, IMarkerModelData> get statesMarkers =>
      _createMarkers(statesData.value, stateBaseSize);

  @computed
  Map<Marker, IMarkerModelData> get citiesMarkers =>
      _createMarkers(citiesData.value, citieBaseSize);

  @observable
  bool isActiveCluster;

  @computed
  int get maxClusterRadius{
    if(isActiveCluster==false) return 0;

    return markerShowed == MarkersType.cities ? cityClusterMaxRadius : stateClusterMaxRadius;
  }

  @action
  toggleActiveCluster(){
    isActiveCluster=!isActiveCluster;
  } 

  @action
  setMarkerShowed(MarkersType markersType) {
    if (markersType != markerShowed) {
      markerShowed = markersType;
    }
  }

  _StatesMapControllerBase(this.covidRepository) {
    fetchStatesData();
  }

  @action
  fetchStatesData() {
    statesData = covidRepository.getStatesInfo().asObservable();
    citiesData = covidRepository.getCitiesInfo().asObservable();
    markerShowed = MarkersType.states;
    isActiveCluster=true;
    // print(citiesData.value);
  }

  Map<Marker, IMarkerModelData> _createMarkers(
      List<IMarkerModelData> markersData, double baseSize) {
    if (markersData == null) return null;

    double quartileCases = getFourthQuartileAverage(markersData);
    Map<Marker, IMarkerModelData> markersMap = Map();
    
    for (IMarkerModelData markerData in markersData) {
      // double calc = log(maxCases / state.confirmed);
      double calc = log(quartileCases / markerData.confirmed);
      

      Marker marker = _makeMarker(
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

  int getMaxCases(List<IMarkerModelData> states) {
    int maxCases = 0;
    for (var state in states) {
      if (state.confirmed > maxCases) {
        maxCases = state.confirmed;
      }
    }
    return maxCases;
  }
  
  double getFourthQuartileAverage(List<IMarkerModelData> states) {
    print(states);
    if(states==null || states.length<4){
      
      return 1;
    }

    int totalCases = 0;
    int quartileValue = states.length~/4;
    states.sort((a,b){
      
      return a.confirmed>=b.confirmed ? 0 : 1;
    });
    
    for (var state in states.getRange(0, quartileValue)) {
      totalCases+= state.confirmed; 
    }
    return totalCases/quartileValue;
  }

  Marker _makeMarker(IMarkerModelData state, Color color, double baseSize) {
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
}

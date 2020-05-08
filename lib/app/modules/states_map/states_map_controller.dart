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

enum MarkersType{
  states,
  cities
}


abstract class _StatesMapControllerBase with Store {
  final double citieBaseSize = 50.0;
  final double stateBaseSize = 35.0;
  final ICovidRepository covidRepository;

  @computed
  Map<Marker, IMarkerModelData> get markers => markerShowed == MarkersType.states ? statesMarkers : citiesMarkers;
  
  // @computed
  // List<IMarkerModelData> get markersData => markerShowed == MarkersType.states ? statesData.value : citiesData.value;

  @observable
  ObservableFuture<List<StateModel>> statesData;

  @observable
  ObservableFuture<List<CityModel>> citiesData;

  @observable MarkersType markerShowed;

  @computed
  Map<Marker, IMarkerModelData> get statesMarkers => _createMarkers(statesData.value,stateBaseSize);

  @computed
  Map<Marker, IMarkerModelData> get citiesMarkers => _createMarkers(citiesData.value,citieBaseSize);

  @action 
  setMarkerShowed(MarkersType markersType){
      if(markersType!= markerShowed){
        markerShowed=markersType;
      }
      
  }

  _StatesMapControllerBase(this.covidRepository) {
    fetchStatesData();
  }

  @action
  fetchStatesData() {
    statesData = covidRepository.getStatesInfo().asObservable();
    citiesData = covidRepository.getCitiesInfo().asObservable();
    markerShowed= MarkersType.states;
    // print(citiesData.value);
  }
  
  Map<Marker, IMarkerModelData> _createMarkers(List<IMarkerModelData> states, double baseSize) {
    
    if (states == null) return null;
    
    int maxCases = getMaxCases(states);
    
    
    Map<Marker, IMarkerModelData> markersMap = Map();
    

    for (IMarkerModelData state in states) {
      
      double calc = log(maxCases / state.confirmed);
      
      Marker marker = _makeMarker(state,
          Color.lerp(Color(0xfff1c40f), Color(0xffc0392b), 1 / max(1, calc)),baseSize);

      markersMap[marker] = state;
    }

    return markersMap;
  }

  int getMaxCases(List<IMarkerModelData> states) {
    int maxCases = 0;
    for (var state in states) {
      if(state.confirmed>maxCases){
        maxCases = state.confirmed;
      }
      
    }
    return maxCases;
  }

  Marker _makeMarker(IMarkerModelData state, Color color,double baseSize) {
    
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
              width: baseSize-10,
              height: baseSize-10,
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

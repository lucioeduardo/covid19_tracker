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
  final ICovidRepository covidRepository;

  @computed
  Map<Marker, IMarkerModelData> get markers => markerShowed == MarkersType.states ? statesMarkers : citiesMarkers;
  
  @computed
  List<IMarkerModelData> get markersData => markerShowed == MarkersType.states ? statesData.value : citiesData.value;

  @observable
  ObservableFuture<List<StateModel>> statesData;

  @observable
  ObservableFuture<List<CityModel>> citiesData;

  @observable MarkersType markerShowed = MarkersType.states;

  @computed
  Map<Marker, IMarkerModelData> get statesMarkers => _createMarkers(statesData.value);

  @computed
  Map<Marker, IMarkerModelData> get citiesMarkers => _createMarkers(citiesData.value);

  @action 
  setMarkerShowed(MarkersType markersType){
      markerShowed=markersType;
  }

  _StatesMapControllerBase(this.covidRepository) {
    fetchStatesData();
  }

  @action
  fetchStatesData() {
    statesData = covidRepository.getStatesInfo().asObservable();
    citiesData = covidRepository.getCitiesInfo().asObservable();
    // print(citiesData.value);
  }
  
  Map<Marker, IMarkerModelData> _createMarkers(List<IMarkerModelData> states) {
    
    if (states == null) return null;
    
    int maxCases = getMaxCases(states);
    
    
    Map<Marker, IMarkerModelData> markersMap = Map();
    

    for (IMarkerModelData state in states) {
      
      double calc = log(maxCases / state.confirmed);
      
      Marker marker = _makeMarker(state,
          Color.lerp(Color(0xfff1c40f), Color(0xffc0392b), 1 / max(1, calc)));

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

  Marker _makeMarker(IMarkerModelData state, Color color) {
    
    return Marker(
      width: 47.0,
      height: 47.0,
      point: state.latLng,
      builder: (ctx) => Container(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: 47,
            height: 47,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 3),
            ),
            child: Container(
              width: 37,
              height: 37,
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

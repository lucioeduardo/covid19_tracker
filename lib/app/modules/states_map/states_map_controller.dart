import 'dart:math';

import 'package:corona_data/app/modules/states_map/utils/states_map_markers.dart';
import 'package:corona_data/app/modules/states_map/utils/states_map_utils.dart';
import 'package:corona_data/app/shared/models/city_model.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
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

  @observable
  MarkersType markerShowed;

  @observable
  ObservableFuture<List<StateModel>> statesData;

  @observable
  ObservableFuture<List<CityModel>> citiesData;

  @observable
  bool isActiveCluster;

  _StatesMapControllerBase(this.covidRepository) {
    fetchData();
  }

  @observable
  LatLngBounds currentBounds;

  @computed
  Map<Marker, IMarkerModelData> get markersShowed {
    if (currentBounds == null || markerShowed == MarkersType.states)
      return markers;

    Map<Marker, IMarkerModelData> currentMarkers = Map();
    for (Marker marker in markers.keys) {
      if (currentBounds.contains(markers[marker].latLng)) {
        currentMarkers[marker] = markers[marker];
      }
    }

    return currentMarkers;
  }

  @computed
  Map<Marker, IMarkerModelData> get markers =>
      markerShowed == MarkersType.states ? statesMarkers : citiesMarkers;

  @computed
  Map<Marker, IMarkerModelData> get statesMarkers =>
      createMarkers(statesData.value, stateBaseSize);

  @computed
  Map<Marker, IMarkerModelData> get citiesMarkers =>
      createMarkers(citiesData.value, citieBaseSize);

  @computed
  int get maxClusterRadius {
    if (isActiveCluster == false) return 0;

    return markerShowed == MarkersType.cities
        ? cityClusterMaxRadius
        : stateClusterMaxRadius;
  }

  @action
  fetchData() {
    statesData = covidRepository.getStatesInfo().asObservable();
    citiesData = covidRepository.getCitiesInfo().asObservable();

    markerShowed = MarkersType.states;
    isActiveCluster = true;
  }

  @action
  toggleActiveCluster() {
    isActiveCluster = !isActiveCluster;
  }

  @action
  setMarkerShowed(MarkersType markersType) {
    if (markersType != markerShowed) {
      markerShowed = markersType;
    }
  }

  @action
  _setBounds(LatLngBounds bounds) {
    currentBounds = bounds;
  }

  void setBounds(LatLngBounds bounds) {
    Debounce.milliseconds(
      300,
      _setBounds,
      [bounds],
    );
  }
}

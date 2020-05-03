import 'dart:math';

import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mobx/mobx.dart';

part 'states_map_controller.g.dart';

class StatesMapController = _StatesMapControllerBase with _$StatesMapController;

abstract class _StatesMapControllerBase with Store {
  final ICovidRepository covidRepository;

  @computed
  Map<Marker, StateModel> get markers => _createMarkers(statesData.value);

  @observable
  ObservableFuture<List<StateModel>> statesData;

  _StatesMapControllerBase(this.covidRepository) {
    fetchStatesData();
  }

  @action
  fetchStatesData() {
    statesData = covidRepository.getStatesInfo().asObservable();
  }

  Map<Marker, StateModel> _createMarkers(List<StateModel> states) {
    if (states == null) return null;

    int maxCases = states
        .reduce((current, next) =>
            current.confirmed > next.confirmed ? current : next)
        .confirmed;

    Map<Marker, StateModel> markersMap = Map();

    for (StateModel state in states) {
      double v = log(maxCases / state.confirmed);

      print(v);

      Marker marker = _makeMarker(state,
          Color.lerp(Color(0xfff1c40f), Color(0xffc0392b), 1 / max(1, v)));

      markersMap[marker] = state;
    }

    return markersMap;
  }

  Marker _makeMarker(StateModel state, Color color) {
    return Marker(
      width: 50.0,
      height: 50.0,
      point: stateCoords[state.state],
      builder: (ctx) => Container(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 3),
            ),
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Text(
                state.state,
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

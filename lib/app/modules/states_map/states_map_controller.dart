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
  fetchStatesData(){
    statesData = covidRepository.getStatesInfo().asObservable();
  }

  Map<Marker, StateModel> _createMarkers(List<StateModel> states) {

    if(states == null) return null;

    states.sort((a, b) => (a.confirmed < b.confirmed ? 0 : 1));

    final int maxCases = states[states.length - 1].confirmed;

    const colors = [
      Color(0xffffd100),
      Color(0xffff9500),
      Color(0xffe25822),
      Color(0xffb22222),
      Color(0xff7c0a02),
    ];

    Map<Marker,StateModel> markersMap = Map();

    for(StateModel state in states){
      Marker marker = _makeMarker(state);

      markersMap[marker] = state;
    }

    return markersMap;
  }

  Marker _makeMarker(StateModel state) {
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
                  border:
                      Border.all(color: Colors.red.withAlpha(200), width: 3),
                ),
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
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

  int _calcWidth(int numCases, int maxCases) {
    int minWidth = 25;
    int maxWidth = 70;

    numCases = min(numCases, maxCases);

    return (minWidth + (maxWidth - minWidth) * (numCases / maxCases)).toInt();
  }
}

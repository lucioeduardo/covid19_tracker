import 'dart:math';

import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/utils/markers_util.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'states_map_controller.g.dart';

class StatesMapController = _StatesMapControllerBase with _$StatesMapController;

abstract class _StatesMapControllerBase with Store {
  final ICovidRepository covidRepository;

  @observable
  ObservableFuture<Set<Marker>> markers;

  _StatesMapControllerBase(this.covidRepository) {
    fetchMarkers();
  }

  @action
  fetchMarkers() {
    markers = createMarkers().asObservable();
  }

  Future<Set<Marker>> createMarkers() async {
    List states = await covidRepository.getStatesInfo();

    states.sort((a, b) => (a.confirmed < b.confirmed ? 0 : 1));

    final int maxCases = states[states.length - 1].confirmed;

    const colors = [
      Color(0xffffff00),
      Color(0xffffd100),
      Color(0xffff9500),
      Color(0xffff3c00),
      Color(0xffff0000),
    ];

    Set<Marker> markersSet = Set();

    int idx = 0;
    for (StateModel state in states) {
      BitmapDescriptor icon = await getMarkerIcon(
          colors[idx ~/ 6], _calcWidth(state.confirmed, maxCases));
      markersSet.add(getStateMarker(state, icon));
      idx++;
    }

    return markersSet;
  }

  int _calcWidth(int numCases, int maxCases) {
    int minWidth = 25;
    int maxWidth = 70;

    numCases = min(numCases, maxCases);

    return (minWidth + (maxWidth - minWidth) * (numCases / maxCases)).toInt();
  }

  Color _calcColor(int numCases, int maxCases) {
    numCases = min(numCases, maxCases);

    return Color.lerp(Colors.red[300], Colors.red[800], numCases / maxCases);
  }
}

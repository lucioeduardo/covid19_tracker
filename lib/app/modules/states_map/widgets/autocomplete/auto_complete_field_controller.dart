import 'dart:async';

import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/shared/extensions/list/normalize_list_size.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:corona_data/app/shared/extensions/list/where_limit_list_extension.dart';
import 'package:corona_data/app/shared/extensions/string/diacritcs_string_extension.dart';
part 'auto_complete_field_controller.g.dart';

class AutoCompleteFieldController = _AutoCompleteFieldControllerBase
    with _$AutoCompleteFieldController;

abstract class _AutoCompleteFieldControllerBase
    with Store
    implements Disposable {
  ReactionDisposer whenCitiesData;
  ReactionDisposer whenStatesData;
  ReactionDisposer whenCountryData;
  Timer forceShowTimer;
  final int showAutocompleteTime = 1500;
  _AutoCompleteFieldControllerBase(this.mapsController, this.localStorage) {
    loadLatestSearchs();
    reactionsLoadAllMarkersSearchableData();
  }

  final StatesMapController mapsController;
  final ILocalStorage localStorage;

  List<IMarkerModelData> allMarkersSearchableData = [];

  @observable
  ObservableFuture<List<String>> latestSearchs;

  @observable
  bool forceShowAutocomplete = false;

  @computed
  bool get isShowAutocomplete {
    return (this.mapsController.citiesData.value != null &&
            this.mapsController.statesData.value != null &&
            this.mapsController.countriesData.value != null) ||
        forceShowAutocomplete;
  }

  @action
  void loadLatestSearchs() {
    latestSearchs = localStorage.getLatestSearchs().asObservable();
  }

  @action
  void setForceShowAutocomplete(bool value) {
    this.forceShowAutocomplete = value;
  }

  @action
  void addToLatestSearchs(String search) {
    if (latestSearchs.value == null || search == null || search.isEmpty) {
    } else {
      List<String> tempLatestSearchs = latestSearchs.value;
      int index = tempLatestSearchs.indexOf(search);
      if (index != -1) tempLatestSearchs.removeAt(index);

      tempLatestSearchs.insert(0, search);

      tempLatestSearchs = tempLatestSearchs.normalizeListSize(6);
      localStorage.setLatestSearchs(tempLatestSearchs);
      latestSearchs = ObservableFuture.value(tempLatestSearchs);
    }
  }

  Future<List<IMarkerModelData>> findMarkers(String query) async {
    if (query == null) {
      return [];
    } else if (query.isEmpty) {
      return findLatestMarkers(latestSearchs.value);
    }

    return findOnMarkers(query);
  }

  @visibleForTesting
  Future<List<IMarkerModelData>> findLatestMarkers(
      List<String> latestSearchs) async {
    if (latestSearchs == null || latestSearchs.isEmpty) return [];

    List<IMarkerModelData> tempList = [];
    latestSearchs.forEach((e) {
      IMarkerModelData tempElement =
          allMarkersSearchableData.firstWhere((element) {
        return element.key == e;
      }, orElse: () {});
      if (tempElement != null) {
        tempList.add(tempElement);
      }
    });

    return (tempList);
  }

  @visibleForTesting
  Future<List<IMarkerModelData>> findOnMarkers(String query) async {
    query = query.toLowerCase().normalizeDiacritics();
    return this.allMarkersSearchableData.whereLimit((marker) {
      return marker.title.toLowerCase().normalizeDiacritics().contains(
            query,
          );
    }, limit: 15);
  }

  @visibleForTesting
  void reactionsLoadAllMarkersSearchableData() {
    allMarkersSearchableData.clear();
    whenCitiesData = when((_) => mapsController.citiesData.value != null, () {
      allMarkersSearchableData.addAll(mapsController.citiesData.value);
    });
    whenStatesData = when((_) => mapsController.statesData.value != null, () {
      allMarkersSearchableData.addAll(mapsController.statesData.value);
    });
    whenCountryData =
        when((_) => mapsController.countriesData.value != null, () {
      allMarkersSearchableData.addAll(mapsController.countriesData.value);
    });
    forceShowTimer = defineShowAutocompleteTimer(
        Duration(milliseconds: showAutocompleteTime));
  }

  @visibleForTesting
  Timer defineShowAutocompleteTimer(Duration duration) {
    return Timer(duration, () {
      setForceShowAutocomplete(true);
    });
  }

  @override
  void dispose() {
    whenCitiesData();
    whenStatesData();
    whenCountryData();
    forceShowTimer.cancel();
  }
}

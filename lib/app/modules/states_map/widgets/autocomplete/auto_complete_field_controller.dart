import 'dart:async';

import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/shared/extensions/list/normalize_list_size.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:corona_data/app/shared/extensions/list/where_limit_list_extension.dart';
import 'package:corona_data/app/shared/extensions/string/diacritcs_string_extension.dart';
part 'auto_complete_field_controller.g.dart';

class AutoCompleteFieldController = _AutoCompleteFieldControllerBase
    with _$AutoCompleteFieldController;

abstract class _AutoCompleteFieldControllerBase with Store {
  _AutoCompleteFieldControllerBase(this.mapsController, this.localStorage) {
    loadLatestSearchs();
  }

  final StatesMapController mapsController;
  final ILocalStorage localStorage;

  List<IMarkerModelData> allMarkersData = [];

  @observable
  ObservableFuture<List<String>> latestSearchs;

  @observable
  bool forceShowAutocomplete;

  @computed
  bool get isShowAutocomplete {

    
    return (this.mapsController.citiesData.value != null &&
        this.mapsController.statesData.value != null &&
        this.mapsController.countriesData.value != null);
  }

  @action
  void loadLatestSearchs() {
    latestSearchs = localStorage.getLatestSearchs().asObservable();
  }

  @action 
  void setForceShowAutocomplete(bool value){
    this.forceShowAutocomplete = value;
  }

  @action
  void addToLatestSearchs(String search) {
    if (latestSearchs.value == null || search == null || search.isEmpty) {
    } else {
      print(search);
      List<String> tempLatestSearchs = latestSearchs.value;
      int index = tempLatestSearchs.indexOf(search);
      if (index != -1) tempLatestSearchs.removeAt(index);

      tempLatestSearchs.insert(0, search);

      tempLatestSearchs = tempLatestSearchs.normalizeListSize(6);
      localStorage.setLatestSearchs(tempLatestSearchs);
      latestSearchs = ObservableFuture.value(tempLatestSearchs);
    }
  }

  List<IMarkerModelData> get allMarkers {
    if (allMarkersData != null && allMarkersData.isNotEmpty)
      return allMarkersData;

    return this.getAllMarkers();
  }

  List<IMarkerModelData> getAllMarkers() {
    allMarkersData.clear();
    allMarkersData.addAll(mapsController.citiesData.value);
    allMarkersData.addAll(mapsController.statesData.value);
    allMarkersData.addAll(mapsController.countriesData.value);

    return allMarkersData;
  }

  Future<List<IMarkerModelData>> findMarkers(String query) async {
    if (query == null) {
      return [];
    } else if (query.isEmpty) {
      return findLatestMarkers(latestSearchs.value);
    }

    return findOnMarkers(query);
  }

  Future<List<IMarkerModelData>> findLatestMarkers(
      List<String> latestSearchs) async {
    if (latestSearchs == null || latestSearchs.isEmpty) return [];

    List<IMarkerModelData> tempList = [];
    latestSearchs.forEach((e) {
      IMarkerModelData tempElement = allMarkers.firstWhere((element) {
        return element.key == e;
      }, orElse: () {});
      if (tempElement != null) {
        tempList.add(tempElement);
      }
    });

    return (tempList);
  }

  Future<List<IMarkerModelData>> findOnMarkers(String query) async {
    query = query.toLowerCase().normalizeDiacritics();
    return this.allMarkers.whereLimit((marker) {
      return marker.title.toLowerCase().normalizeDiacritics().contains(
            query,
          );
    }, limit: 15);
  }

  // @override
  // void dispose() {
  //   // allMarkersData = [];
  //   // print("Autocomplete controller disposado");

  // }

}

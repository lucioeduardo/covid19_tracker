import 'package:corona_data/app/modules/states_map/utils/states_map_markers.dart';
import 'package:corona_data/app/shared/extensions/list/where_limit_list_extension.dart';
import 'package:corona_data/app/shared/extensions/string/diacritcs_string_extension.dart';
import 'package:corona_data/app/shared/models/city_model.dart';
import 'package:corona_data/app/shared/models/country_model_marker.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:mobx/mobx.dart';

part 'states_map_controller.g.dart';

class StatesMapController = _StatesMapControllerBase with _$StatesMapController;

enum MarkersType { states, cities }

abstract class _StatesMapControllerBase with Store implements Disposable{
  final int cityClusterMaxRadius = 170;
  final int stateClusterMaxRadius = 40;
  final ICovidRepository covidRepository;


  @observable
  MarkersType markerShowed;

  @observable
  ObservableFuture<List<StateModel>> statesData;

  @observable
  ObservableFuture<List<CityModel>> citiesData;

  @observable
  ObservableFuture<List<CountryModelMarker>> countriesData;

  @observable
  bool isActiveCluster;

  _StatesMapControllerBase(this.covidRepository) {
    fetchData();
  }

  @observable
  LatLngBounds currentBounds;

  @computed
  Map<Marker, IMarkerModelData> get markersShowed {
    if (currentBounds == null || markers == null) return markers;

    Map<Marker, IMarkerModelData> currentMarkers = Map();
    for (Marker marker in markers.keys) {
      if (markers[marker].latLng != null &&
          currentBounds.contains(
            markers[marker].latLng,
          )) {
        currentMarkers[marker] = markers[marker];
      }
    }
    return currentMarkers;
  }

  @computed
  Map<Marker, IMarkerModelData> get markers =>
      markerShowed == MarkersType.states
          ? statesAndCountriesMarkers
          : citiesMarkers;

  @computed
  Map<Marker, IMarkerModelData> get statesMarkers =>
      createMarkers(statesData.value);

  @computed
  Map<Marker, IMarkerModelData> get citiesMarkers =>
      createMarkers(citiesData.value);

  @computed
  Map<Marker, IMarkerModelData> get countriesMarkers =>
      createMarkers(countriesData.value);

  @computed
  Map<Marker, IMarkerModelData> get statesAndCountriesMarkers {
    if (statesMarkers == null || countriesMarkers == null)
      return Map<Marker, IMarkerModelData>();
    

    return {}..addAll(statesMarkers)..addAll(countriesMarkers);
  }

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
    countriesData = covidRepository.getCountriesInfo().asObservable();
    
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

  // @comput
  List<IMarkerModelData> _allMarkersData = [];
  List<IMarkerModelData> get allMarkers {
    if (_allMarkersData != null && _allMarkersData.isNotEmpty)
      return _allMarkersData;
    _allMarkersData.addAll(citiesData.value);
    _allMarkersData.addAll(statesData.value);
    _allMarkersData.addAll(countriesData.value);
    return _allMarkersData;
  }

  Future<List<IMarkerModelData>> findMarkers(String query) async {
    query = query.toLowerCase().normalizeDiacritics();

    if (query.isEmpty || query == null) {
      return [];
    }

    return this.allMarkers.whereLimit((marker) {
      return marker.title.toLowerCase().normalizeDiacritics().contains(
            query,
          );
    }, limit: 15);
  }

  void setBounds(LatLngBounds bounds) {
    Debounce.milliseconds(
      300,
      _setBounds,
      [bounds],
    );
    
  }

  @override
  void dispose() {
    Debounce.clear(_setBounds);
    
  }
  
}

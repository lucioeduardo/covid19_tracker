// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatesMapController on _StatesMapControllerBase, Store {
  Computed<Map<Marker, IMarkerModelData>> _$markersComputed;

  @override
  Map<Marker, IMarkerModelData> get markers => (_$markersComputed ??=
          Computed<Map<Marker, IMarkerModelData>>(() => super.markers))
      .value;
  Computed<List<IMarkerModelData>> _$markersDataComputed;

  @override
  List<IMarkerModelData> get markersData => (_$markersDataComputed ??=
          Computed<List<IMarkerModelData>>(() => super.markersData))
      .value;
  Computed<Map<Marker, IMarkerModelData>> _$statesMarkersComputed;

  @override
  Map<Marker, IMarkerModelData> get statesMarkers =>
      (_$statesMarkersComputed ??= Computed<Map<Marker, IMarkerModelData>>(
              () => super.statesMarkers))
          .value;
  Computed<Map<Marker, IMarkerModelData>> _$citiesMarkersComputed;

  @override
  Map<Marker, IMarkerModelData> get citiesMarkers =>
      (_$citiesMarkersComputed ??= Computed<Map<Marker, IMarkerModelData>>(
              () => super.citiesMarkers))
          .value;

  final _$statesDataAtom = Atom(name: '_StatesMapControllerBase.statesData');

  @override
  ObservableFuture<List<StateModel>> get statesData {
    _$statesDataAtom.context.enforceReadPolicy(_$statesDataAtom);
    _$statesDataAtom.reportObserved();
    return super.statesData;
  }

  @override
  set statesData(ObservableFuture<List<StateModel>> value) {
    _$statesDataAtom.context.conditionallyRunInAction(() {
      super.statesData = value;
      _$statesDataAtom.reportChanged();
    }, _$statesDataAtom, name: '${_$statesDataAtom.name}_set');
  }

  final _$citiesDataAtom = Atom(name: '_StatesMapControllerBase.citiesData');

  @override
  ObservableFuture<List<CityModel>> get citiesData {
    _$citiesDataAtom.context.enforceReadPolicy(_$citiesDataAtom);
    _$citiesDataAtom.reportObserved();
    return super.citiesData;
  }

  @override
  set citiesData(ObservableFuture<List<CityModel>> value) {
    _$citiesDataAtom.context.conditionallyRunInAction(() {
      super.citiesData = value;
      _$citiesDataAtom.reportChanged();
    }, _$citiesDataAtom, name: '${_$citiesDataAtom.name}_set');
  }

  final _$markerShowedAtom =
      Atom(name: '_StatesMapControllerBase.markerShowed');

  @override
  MarkersType get markerShowed {
    _$markerShowedAtom.context.enforceReadPolicy(_$markerShowedAtom);
    _$markerShowedAtom.reportObserved();
    return super.markerShowed;
  }

  @override
  set markerShowed(MarkersType value) {
    _$markerShowedAtom.context.conditionallyRunInAction(() {
      super.markerShowed = value;
      _$markerShowedAtom.reportChanged();
    }, _$markerShowedAtom, name: '${_$markerShowedAtom.name}_set');
  }

  final _$_StatesMapControllerBaseActionController =
      ActionController(name: '_StatesMapControllerBase');

  @override
  dynamic setMarkerShowed(MarkersType markersType) {
    final _$actionInfo =
        _$_StatesMapControllerBaseActionController.startAction();
    try {
      return super.setMarkerShowed(markersType);
    } finally {
      _$_StatesMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchStatesData() {
    final _$actionInfo =
        _$_StatesMapControllerBaseActionController.startAction();
    try {
      return super.fetchStatesData();
    } finally {
      _$_StatesMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'statesData: ${statesData.toString()},citiesData: ${citiesData.toString()},markerShowed: ${markerShowed.toString()},markers: ${markers.toString()},markersData: ${markersData.toString()},statesMarkers: ${statesMarkers.toString()},citiesMarkers: ${citiesMarkers.toString()}';
    return '{$string}';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatesMapController on _StatesMapControllerBase, Store {
  Computed<Map<Marker, IMarkerModelData>> _$markersShowedComputed;

  @override
  Map<Marker, IMarkerModelData> get markersShowed =>
      (_$markersShowedComputed ??= Computed<Map<Marker, IMarkerModelData>>(
              () => super.markersShowed))
          .value;
  Computed<Map<Marker, IMarkerModelData>> _$markersComputed;

  @override
  Map<Marker, IMarkerModelData> get markers => (_$markersComputed ??=
          Computed<Map<Marker, IMarkerModelData>>(() => super.markers))
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
  Computed<List<IMarkerModelData>> _$allMarkersComputed;

  @override
  List<IMarkerModelData> get allMarkers => (_$allMarkersComputed ??=
          Computed<List<IMarkerModelData>>(() => super.allMarkers))
      .value;
  Computed<int> _$maxClusterRadiusComputed;

  @override
  int get maxClusterRadius => (_$maxClusterRadiusComputed ??=
          Computed<int>(() => super.maxClusterRadius))
      .value;

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

  final _$isActiveClusterAtom =
      Atom(name: '_StatesMapControllerBase.isActiveCluster');

  @override
  bool get isActiveCluster {
    _$isActiveClusterAtom.context.enforceReadPolicy(_$isActiveClusterAtom);
    _$isActiveClusterAtom.reportObserved();
    return super.isActiveCluster;
  }

  @override
  set isActiveCluster(bool value) {
    _$isActiveClusterAtom.context.conditionallyRunInAction(() {
      super.isActiveCluster = value;
      _$isActiveClusterAtom.reportChanged();
    }, _$isActiveClusterAtom, name: '${_$isActiveClusterAtom.name}_set');
  }

  final _$currentBoundsAtom =
      Atom(name: '_StatesMapControllerBase.currentBounds');

  @override
  LatLngBounds get currentBounds {
    _$currentBoundsAtom.context.enforceReadPolicy(_$currentBoundsAtom);
    _$currentBoundsAtom.reportObserved();
    return super.currentBounds;
  }

  @override
  set currentBounds(LatLngBounds value) {
    _$currentBoundsAtom.context.conditionallyRunInAction(() {
      super.currentBounds = value;
      _$currentBoundsAtom.reportChanged();
    }, _$currentBoundsAtom, name: '${_$currentBoundsAtom.name}_set');
  }

  final _$_StatesMapControllerBaseActionController =
      ActionController(name: '_StatesMapControllerBase');

  @override
  dynamic fetchData() {
    final _$actionInfo =
        _$_StatesMapControllerBaseActionController.startAction();
    try {
      return super.fetchData();
    } finally {
      _$_StatesMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleActiveCluster() {
    final _$actionInfo =
        _$_StatesMapControllerBaseActionController.startAction();
    try {
      return super.toggleActiveCluster();
    } finally {
      _$_StatesMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic _setBounds(LatLngBounds bounds) {
    final _$actionInfo =
        _$_StatesMapControllerBaseActionController.startAction();
    try {
      return super._setBounds(bounds);
    } finally {
      _$_StatesMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'markerShowed: ${markerShowed.toString()},statesData: ${statesData.toString()},citiesData: ${citiesData.toString()},isActiveCluster: ${isActiveCluster.toString()},currentBounds: ${currentBounds.toString()},markersShowed: ${markersShowed.toString()},markers: ${markers.toString()},statesMarkers: ${statesMarkers.toString()},citiesMarkers: ${citiesMarkers.toString()},allMarkers: ${allMarkers.toString()},maxClusterRadius: ${maxClusterRadius.toString()}';
    return '{$string}';
  }
}

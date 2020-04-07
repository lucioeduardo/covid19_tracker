// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatesMapController on _StatesMapControllerBase, Store {
  final _$markersAtom = Atom(name: '_StatesMapControllerBase.markers');

  @override
  ObservableFuture<Set<Marker>> get markers {
    _$markersAtom.context.enforceReadPolicy(_$markersAtom);
    _$markersAtom.reportObserved();
    return super.markers;
  }

  @override
  set markers(ObservableFuture<Set<Marker>> value) {
    _$markersAtom.context.conditionallyRunInAction(() {
      super.markers = value;
      _$markersAtom.reportChanged();
    }, _$markersAtom, name: '${_$markersAtom.name}_set');
  }

  final _$_StatesMapControllerBaseActionController =
      ActionController(name: '_StatesMapControllerBase');

  @override
  dynamic fetchMarkers() {
    final _$actionInfo =
        _$_StatesMapControllerBaseActionController.startAction();
    try {
      return super.fetchMarkers();
    } finally {
      _$_StatesMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'markers: ${markers.toString()}';
    return '{$string}';
  }
}

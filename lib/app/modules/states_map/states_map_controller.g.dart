// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatesMapController on _StatesMapControllerBase, Store {
  Computed<Map<Marker, StateModel>> _$markersComputed;

  @override
  Map<Marker, StateModel> get markers => (_$markersComputed ??=
          Computed<Map<Marker, StateModel>>(() => super.markers))
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

  final _$_StatesMapControllerBaseActionController =
      ActionController(name: '_StatesMapControllerBase');

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
        'statesData: ${statesData.toString()},markers: ${markers.toString()}';
    return '{$string}';
  }
}

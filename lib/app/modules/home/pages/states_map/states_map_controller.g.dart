// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatesMapController on _StatesMapControllerBase, Store {
  final _$statesInfoAtom = Atom(name: '_StatesMapControllerBase.statesInfo');

  @override
  ObservableFuture<List<StateModel>> get statesInfo {
    _$statesInfoAtom.context.enforceReadPolicy(_$statesInfoAtom);
    _$statesInfoAtom.reportObserved();
    return super.statesInfo;
  }

  @override
  set statesInfo(ObservableFuture<List<StateModel>> value) {
    _$statesInfoAtom.context.conditionallyRunInAction(() {
      super.statesInfo = value;
      _$statesInfoAtom.reportChanged();
    }, _$statesInfoAtom, name: '${_$statesInfoAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'statesInfo: ${statesInfo.toString()}';
    return '{$string}';
  }
}

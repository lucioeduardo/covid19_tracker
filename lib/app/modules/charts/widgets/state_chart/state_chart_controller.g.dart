// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_chart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StateChartController on _StateChartControllerBase, Store {
  final _$graphDataAtom = Atom(name: '_StateChartControllerBase.graphData');

  @override
  ObservableFuture<Map<String, List<int>>> get graphData {
    _$graphDataAtom.context.enforceReadPolicy(_$graphDataAtom);
    _$graphDataAtom.reportObserved();
    return super.graphData;
  }

  @override
  set graphData(ObservableFuture<Map<String, List<int>>> value) {
    _$graphDataAtom.context.conditionallyRunInAction(() {
      super.graphData = value;
      _$graphDataAtom.reportChanged();
    }, _$graphDataAtom, name: '${_$graphDataAtom.name}_set');
  }

  final _$stateAtom = Atom(name: '_StateChartControllerBase.state');

  @override
  String get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$_StateChartControllerBaseActionController =
      ActionController(name: '_StateChartControllerBase');

  @override
  dynamic setStateName(String state) {
    final _$actionInfo =
        _$_StateChartControllerBaseActionController.startAction();
    try {
      return super.setStateName(state);
    } finally {
      _$_StateChartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchGraphData() {
    final _$actionInfo =
        _$_StateChartControllerBaseActionController.startAction();
    try {
      return super.fetchGraphData();
    } finally {
      _$_StateChartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'graphData: ${graphData.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}

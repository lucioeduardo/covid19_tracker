// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'world_cases_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorldCasesController on _WorldCasesControllerBase, Store {
  final _$graphDataAtom = Atom(name: '_WorldCasesControllerBase.graphData');

  @override
  ObservableFuture<List<int>> get graphData {
    _$graphDataAtom.context.enforceReadPolicy(_$graphDataAtom);
    _$graphDataAtom.reportObserved();
    return super.graphData;
  }

  @override
  set graphData(ObservableFuture<List<int>> value) {
    _$graphDataAtom.context.conditionallyRunInAction(() {
      super.graphData = value;
      _$graphDataAtom.reportChanged();
    }, _$graphDataAtom, name: '${_$graphDataAtom.name}_set');
  }

  final _$_WorldCasesControllerBaseActionController =
      ActionController(name: '_WorldCasesControllerBase');

  @override
  void fetchGraphData() {
    final _$actionInfo =
        _$_WorldCasesControllerBaseActionController.startAction();
    try {
      return super.fetchGraphData();
    } finally {
      _$_WorldCasesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'graphData: ${graphData.toString()}';
    return '{$string}';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_chart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CityChartController on _CityChartControllerBase, Store {
  final _$graphDataAtom = Atom(name: '_CityChartControllerBase.graphData');

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

  final _$cityCodeAtom = Atom(name: '_CityChartControllerBase.cityCode');

  @override
  String get cityCode {
    _$cityCodeAtom.context.enforceReadPolicy(_$cityCodeAtom);
    _$cityCodeAtom.reportObserved();
    return super.cityCode;
  }

  @override
  set cityCode(String value) {
    _$cityCodeAtom.context.conditionallyRunInAction(() {
      super.cityCode = value;
      _$cityCodeAtom.reportChanged();
    }, _$cityCodeAtom, name: '${_$cityCodeAtom.name}_set');
  }

  final _$_CityChartControllerBaseActionController =
      ActionController(name: '_CityChartControllerBase');

  @override
  dynamic setCityCode(String cityCode) {
    final _$actionInfo =
        _$_CityChartControllerBaseActionController.startAction();
    try {
      return super.setCityCode(cityCode);
    } finally {
      _$_CityChartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchGraphData() {
    final _$actionInfo =
        _$_CityChartControllerBaseActionController.startAction();
    try {
      return super.fetchGraphData();
    } finally {
      _$_CityChartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'graphData: ${graphData.toString()},cityCode: ${cityCode.toString()}';
    return '{$string}';
  }
}

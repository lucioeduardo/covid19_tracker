// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_chart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountryChartController on _CountryChartControllerBase, Store {
  final _$graphDataAtom = Atom(name: '_CountryChartControllerBase.graphData');

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

  final _$countryNameAtom =
      Atom(name: '_CountryChartControllerBase.countryName');

  @override
  String get countryName {
    _$countryNameAtom.context.enforceReadPolicy(_$countryNameAtom);
    _$countryNameAtom.reportObserved();
    return super.countryName;
  }

  @override
  set countryName(String value) {
    _$countryNameAtom.context.conditionallyRunInAction(() {
      super.countryName = value;
      _$countryNameAtom.reportChanged();
    }, _$countryNameAtom, name: '${_$countryNameAtom.name}_set');
  }

  final _$_CountryChartControllerBaseActionController =
      ActionController(name: '_CountryChartControllerBase');

  @override
  dynamic setCountryName(String country) {
    final _$actionInfo =
        _$_CountryChartControllerBaseActionController.startAction();
    try {
      return super.setCountryName(country);
    } finally {
      _$_CountryChartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchGraphData() {
    final _$actionInfo =
        _$_CountryChartControllerBaseActionController.startAction();
    try {
      return super.fetchGraphData();
    } finally {
      _$_CountryChartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'graphData: ${graphData.toString()},countryName: ${countryName.toString()}';
    return '{$string}';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChartSettingsStore on _ChartSettingsStoreBase, Store {
  final _$showCasesAtom = Atom(name: '_ChartSettingsStoreBase.showCases');

  @override
  bool get showCases {
    _$showCasesAtom.context.enforceReadPolicy(_$showCasesAtom);
    _$showCasesAtom.reportObserved();
    return super.showCases;
  }

  @override
  set showCases(bool value) {
    _$showCasesAtom.context.conditionallyRunInAction(() {
      super.showCases = value;
      _$showCasesAtom.reportChanged();
    }, _$showCasesAtom, name: '${_$showCasesAtom.name}_set');
  }

  final _$showRecoveredAtom =
      Atom(name: '_ChartSettingsStoreBase.showRecovered');

  @override
  bool get showRecovered {
    _$showRecoveredAtom.context.enforceReadPolicy(_$showRecoveredAtom);
    _$showRecoveredAtom.reportObserved();
    return super.showRecovered;
  }

  @override
  set showRecovered(bool value) {
    _$showRecoveredAtom.context.conditionallyRunInAction(() {
      super.showRecovered = value;
      _$showRecoveredAtom.reportChanged();
    }, _$showRecoveredAtom, name: '${_$showRecoveredAtom.name}_set');
  }

  final _$showDeathsAtom = Atom(name: '_ChartSettingsStoreBase.showDeaths');

  @override
  bool get showDeaths {
    _$showDeathsAtom.context.enforceReadPolicy(_$showDeathsAtom);
    _$showDeathsAtom.reportObserved();
    return super.showDeaths;
  }

  @override
  set showDeaths(bool value) {
    _$showDeathsAtom.context.conditionallyRunInAction(() {
      super.showDeaths = value;
      _$showDeathsAtom.reportChanged();
    }, _$showDeathsAtom, name: '${_$showDeathsAtom.name}_set');
  }

  final _$_ChartSettingsStoreBaseActionController =
      ActionController(name: '_ChartSettingsStoreBase');

  @override
  void setOption(dynamic option) {
    final _$actionInfo =
        _$_ChartSettingsStoreBaseActionController.startAction();
    try {
      return super.setOption(option);
    } finally {
      _$_ChartSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'showCases: ${showCases.toString()},showRecovered: ${showRecovered.toString()},showDeaths: ${showDeaths.toString()}';
    return '{$string}';
  }
}

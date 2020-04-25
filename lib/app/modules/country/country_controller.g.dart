// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountryController on _CountryControllerBase, Store {
  final _$countryInfoAtom = Atom(name: '_CountryControllerBase.countryInfo');

  @override
  ObservableFuture<InfoModel> get countryInfo {
    _$countryInfoAtom.context.enforceReadPolicy(_$countryInfoAtom);
    _$countryInfoAtom.reportObserved();
    return super.countryInfo;
  }

  @override
  set countryInfo(ObservableFuture<InfoModel> value) {
    _$countryInfoAtom.context.conditionallyRunInAction(() {
      super.countryInfo = value;
      _$countryInfoAtom.reportChanged();
    }, _$countryInfoAtom, name: '${_$countryInfoAtom.name}_set');
  }

  final _$_CountryControllerBaseActionController =
      ActionController(name: '_CountryControllerBase');

  @override
  dynamic fetchCountryInfo() {
    final _$actionInfo = _$_CountryControllerBaseActionController.startAction();
    try {
      return super.fetchCountryInfo();
    } finally {
      _$_CountryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'countryInfo: ${countryInfo.toString()}';
    return '{$string}';
  }
}

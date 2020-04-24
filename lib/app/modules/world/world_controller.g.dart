// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'world_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WorldController on _WorldControllerBase, Store {
  final _$worldInfoAtom = Atom(name: '_WorldControllerBase.worldInfo');

  @override
  ObservableFuture<InfoModel> get worldInfo {
    _$worldInfoAtom.context.enforceReadPolicy(_$worldInfoAtom);
    _$worldInfoAtom.reportObserved();
    return super.worldInfo;
  }

  @override
  set worldInfo(ObservableFuture<InfoModel> value) {
    _$worldInfoAtom.context.conditionallyRunInAction(() {
      super.worldInfo = value;
      _$worldInfoAtom.reportChanged();
    }, _$worldInfoAtom, name: '${_$worldInfoAtom.name}_set');
  }

  final _$_WorldControllerBaseActionController =
      ActionController(name: '_WorldControllerBase');

  @override
  dynamic fetchWorldInfo() {
    final _$actionInfo = _$_WorldControllerBaseActionController.startAction();
    try {
      return super.fetchWorldInfo();
    } finally {
      _$_WorldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'worldInfo: ${worldInfo.toString()}';
    return '{$string}';
  }
}

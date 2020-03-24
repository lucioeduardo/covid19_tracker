// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brazil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BrazilController on _BrazilControllerBase, Store {
  final _$brazilInfoAtom = Atom(name: '_BrazilControllerBase.brazilInfo');

  @override
  ObservableFuture<InfoModel> get brazilInfo {
    _$brazilInfoAtom.context.enforceReadPolicy(_$brazilInfoAtom);
    _$brazilInfoAtom.reportObserved();
    return super.brazilInfo;
  }

  @override
  set brazilInfo(ObservableFuture<InfoModel> value) {
    _$brazilInfoAtom.context.conditionallyRunInAction(() {
      super.brazilInfo = value;
      _$brazilInfoAtom.reportChanged();
    }, _$brazilInfoAtom, name: '${_$brazilInfoAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'brazilInfo: ${brazilInfo.toString()}';
    return '{$string}';
  }
}

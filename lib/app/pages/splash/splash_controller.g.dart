// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  final _$_timerAtom = Atom(name: '_SplashControllerBase._timer');

  @override
  bool get _timer {
    _$_timerAtom.context.enforceReadPolicy(_$_timerAtom);
    _$_timerAtom.reportObserved();
    return super._timer;
  }

  @override
  set _timer(bool value) {
    _$_timerAtom.context.conditionallyRunInAction(() {
      super._timer = value;
      _$_timerAtom.reportChanged();
    }, _$_timerAtom, name: '${_$_timerAtom.name}_set');
  }

  @override
  String toString() {
    final string = '';
    return '{$string}';
  }
}

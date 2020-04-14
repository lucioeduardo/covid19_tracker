// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  final _$themeDarkAtom = Atom(name: '_SplashControllerBase.themeDark');

  @override
  ObservableFuture<bool> get themeDark {
    _$themeDarkAtom.context.enforceReadPolicy(_$themeDarkAtom);
    _$themeDarkAtom.reportObserved();
    return super.themeDark;
  }

  @override
  set themeDark(ObservableFuture<bool> value) {
    _$themeDarkAtom.context.conditionallyRunInAction(() {
      super.themeDark = value;
      _$themeDarkAtom.reportChanged();
    }, _$themeDarkAtom, name: '${_$themeDarkAtom.name}_set');
  }

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

  final _$_SplashControllerBaseActionController =
      ActionController(name: '_SplashControllerBase');

  @override
  void getTheme() {
    final _$actionInfo = _$_SplashControllerBaseActionController.startAction();
    try {
      return super.getTheme();
    } finally {
      _$_SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'themeDark: ${themeDark.toString()}';
    return '{$string}';
  }
}

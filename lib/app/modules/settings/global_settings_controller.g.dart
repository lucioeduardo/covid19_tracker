// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalSettingsController on _GlobalSettingsControllerBase, Store {
  Computed<ThemeData> _$themeComputed;

  @override
  ThemeData get theme =>
      (_$themeComputed ??= Computed<ThemeData>(() => super.theme)).value;
  Computed<bool> _$isReadyComputed;

  @override
  bool get isReady =>
      (_$isReadyComputed ??= Computed<bool>(() => super.isReady)).value;
  Computed<int> _$isChangedComputed;

  @override
  int get isChanged =>
      (_$isChangedComputed ??= Computed<int>(() => super.isChanged)).value;

  final _$themeDarkAtom = Atom(name: '_GlobalSettingsControllerBase.themeDark');

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

  final _$countryNameAtom =
      Atom(name: '_GlobalSettingsControllerBase.countryName');

  @override
  ObservableFuture<String> get countryName {
    _$countryNameAtom.context.enforceReadPolicy(_$countryNameAtom);
    _$countryNameAtom.reportObserved();
    return super.countryName;
  }

  @override
  set countryName(ObservableFuture<String> value) {
    _$countryNameAtom.context.conditionallyRunInAction(() {
      super.countryName = value;
      _$countryNameAtom.reportChanged();
    }, _$countryNameAtom, name: '${_$countryNameAtom.name}_set');
  }

  final _$_GlobalSettingsControllerBaseActionController =
      ActionController(name: '_GlobalSettingsControllerBase');

  @override
  void init() {
    final _$actionInfo =
        _$_GlobalSettingsControllerBaseActionController.startAction();
    try {
      return super.init();
    } finally {
      _$_GlobalSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getTheme() {
    final _$actionInfo =
        _$_GlobalSettingsControllerBaseActionController.startAction();
    try {
      return super.getTheme();
    } finally {
      _$_GlobalSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTheme(bool value) {
    final _$actionInfo =
        _$_GlobalSettingsControllerBaseActionController.startAction();
    try {
      return super.setTheme(value);
    } finally {
      _$_GlobalSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCountry(String country) {
    final _$actionInfo =
        _$_GlobalSettingsControllerBaseActionController.startAction();
    try {
      return super.setCountry(country);
    } finally {
      _$_GlobalSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCountry() {
    final _$actionInfo =
        _$_GlobalSettingsControllerBaseActionController.startAction();
    try {
      return super.getCountry();
    } finally {
      _$_GlobalSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'themeDark: ${themeDark.toString()},countryName: ${countryName.toString()},theme: ${theme.toString()},isReady: ${isReady.toString()},isChanged: ${isChanged.toString()}';
    return '{$string}';
  }
}

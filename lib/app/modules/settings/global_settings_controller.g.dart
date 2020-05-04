// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalSettingsController on _GlobalSettingsControllerBase, Store {
  Computed<String> _$localeKeyComputed;

  @override
  String get localeKey =>
      (_$localeKeyComputed ??= Computed<String>(() => super.localeKey)).value;
  Computed<CountryModel> _$countryComputed;

  @override
  CountryModel get country =>
      (_$countryComputed ??= Computed<CountryModel>(() => super.country)).value;
  Computed<ITheme> _$themeComputed;

  @override
  ITheme get theme =>
      (_$themeComputed ??= Computed<ITheme>(() => super.theme)).value;
  Computed<ILocalization> _$localeComputed;

  @override
  ILocalization get locale =>
      (_$localeComputed ??= Computed<ILocalization>(() => super.locale)).value;
  Computed<bool> _$isReadyComputed;

  @override
  bool get isReady =>
      (_$isReadyComputed ??= Computed<bool>(() => super.isReady)).value;
  Computed<int> _$isChangedComputed;

  @override
  int get isChanged =>
      (_$isChangedComputed ??= Computed<int>(() => super.isChanged)).value;

  final _$themeNameAtom = Atom(name: '_GlobalSettingsControllerBase.themeName');

  @override
  ObservableFuture<String> get themeName {
    _$themeNameAtom.context.enforceReadPolicy(_$themeNameAtom);
    _$themeNameAtom.reportObserved();
    return super.themeName;
  }

  @override
  set themeName(ObservableFuture<String> value) {
    _$themeNameAtom.context.conditionallyRunInAction(() {
      super.themeName = value;
      _$themeNameAtom.reportChanged();
    }, _$themeNameAtom, name: '${_$themeNameAtom.name}_set');
  }

  final _$_storageLocaleAtom =
      Atom(name: '_GlobalSettingsControllerBase._storageLocale');

  @override
  ObservableFuture<String> get _storageLocale {
    _$_storageLocaleAtom.context.enforceReadPolicy(_$_storageLocaleAtom);
    _$_storageLocaleAtom.reportObserved();
    return super._storageLocale;
  }

  @override
  set _storageLocale(ObservableFuture<String> value) {
    _$_storageLocaleAtom.context.conditionallyRunInAction(() {
      super._storageLocale = value;
      _$_storageLocaleAtom.reportChanged();
    }, _$_storageLocaleAtom, name: '${_$_storageLocaleAtom.name}_set');
  }

  final _$_deviceLocaleAtom =
      Atom(name: '_GlobalSettingsControllerBase._deviceLocale');

  @override
  ObservableFuture<Locale> get _deviceLocale {
    _$_deviceLocaleAtom.context.enforceReadPolicy(_$_deviceLocaleAtom);
    _$_deviceLocaleAtom.reportObserved();
    return super._deviceLocale;
  }

  @override
  set _deviceLocale(ObservableFuture<Locale> value) {
    _$_deviceLocaleAtom.context.conditionallyRunInAction(() {
      super._deviceLocale = value;
      _$_deviceLocaleAtom.reportChanged();
    }, _$_deviceLocaleAtom, name: '${_$_deviceLocaleAtom.name}_set');
  }

  final _$_storageCountryAtom =
      Atom(name: '_GlobalSettingsControllerBase._storageCountry');

  @override
  ObservableFuture<CountryModel> get _storageCountry {
    _$_storageCountryAtom.context.enforceReadPolicy(_$_storageCountryAtom);
    _$_storageCountryAtom.reportObserved();
    return super._storageCountry;
  }

  @override
  set _storageCountry(ObservableFuture<CountryModel> value) {
    _$_storageCountryAtom.context.conditionallyRunInAction(() {
      super._storageCountry = value;
      _$_storageCountryAtom.reportChanged();
    }, _$_storageCountryAtom, name: '${_$_storageCountryAtom.name}_set');
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
  void setTheme(String theme) {
    final _$actionInfo =
        _$_GlobalSettingsControllerBaseActionController.startAction();
    try {
      return super.setTheme(theme);
    } finally {
      _$_GlobalSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCountry(CountryModel country) {
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
  void setLocale(String localeKey) {
    final _$actionInfo =
        _$_GlobalSettingsControllerBaseActionController.startAction();
    try {
      return super.setLocale(localeKey);
    } finally {
      _$_GlobalSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getLocale() {
    final _$actionInfo =
        _$_GlobalSettingsControllerBaseActionController.startAction();
    try {
      return super.getLocale();
    } finally {
      _$_GlobalSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'themeName: ${themeName.toString()},localeKey: ${localeKey.toString()},country: ${country.toString()},theme: ${theme.toString()},locale: ${locale.toString()},isReady: ${isReady.toString()},isChanged: ${isChanged.toString()}';
    return '{$string}';
  }
}

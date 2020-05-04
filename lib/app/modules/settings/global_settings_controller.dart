import 'package:corona_data/app/shared/models/country_model.dart';
import 'package:corona_data/app/shared/repositories/local_storage_interface.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/utils/localization/localization_interface.dart';
import 'package:corona_data/app/shared/utils/localization/localization_utils.dart';
import 'package:corona_data/app/shared/utils/theme/theme_interface.dart';
import 'package:corona_data/app/shared/utils/theme/theme_utils.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_device_locale/flutter_device_locale.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'global_settings_controller.g.dart';

class GlobalSettingsController = _GlobalSettingsControllerBase
    with _$GlobalSettingsController;

abstract class _GlobalSettingsControllerBase with Store {
  final ILocalStorage localStorage = Modular.get();

  @observable
  ObservableFuture<String> themeName;

  @observable
  ObservableFuture<String> _storageLocale;

  @observable
  ObservableFuture<Locale> _deviceLocale;

  @computed
  String get localeKey =>
      _storageLocale?.value ?? _deviceLocale?.value?.toString();

  @observable
  ObservableFuture<CountryModel> _storageCountry;

  @computed
  CountryModel get country {
    if (_storageCountry.value != null) {
      return _storageCountry.value;
    }

    if (_deviceLocale.value == null) {
      return null;
    }

    String code = _deviceLocale.value.countryCode;
    String name =
        COUNTRIES.firstWhere((country) => country['code'] == code)['name'];

    return CountryModel(code: code.toLowerCase(), name: name);
  }

  @computed
  ITheme get theme {
    return ThemeUtils.getTheme(themeName?.value);
  }

  @computed
  ILocalization get locale {
    return LocalizationUtils.getLocale(localeKey);
  }

  @computed
  bool get isReady {
    return themeName.value != null && country != null && localeKey != null;
  }

  @action
  void init() {
    getTheme();
    getCountry();
    getLocale();
    getDeviceLocale();
  }

  void getDeviceLocale() {
    _deviceLocale = DeviceLocale.getCurrentLocale().asObservable();
  }

  @computed
  int get isChanged =>
      (_storageCountry.value.name + themeName.value.toString() + localeKey)
          .hashCode;

  @action
  void getTheme() {
    themeName = localStorage.getTheme().asObservable();
  }

  @action
  void setTheme(String theme) {
    if (theme != themeName.value) {
      themeName = ObservableFuture<String>.value(theme);

      localStorage.setTheme(theme);
    }
  }

  @action
  void setCountry(CountryModel country) {
    if (country.code != this._storageCountry.value.code) {
      this._storageCountry = ObservableFuture.value(country);
      localStorage.setCountry(country);
    }
  }

  @action
  void getCountry() {
    this._storageCountry = localStorage.getCountry().asObservable();
  }

  @action
  void setLocale(String localeKey) {
    if (localeKey != this.localeKey) {
      this._storageLocale = ObservableFuture.value(localeKey);
      localStorage.setLocale(localeKey);
    }
  }

  @action
  void getLocale() {
    this._storageLocale = localStorage.getLocale().asObservable();
  }
}

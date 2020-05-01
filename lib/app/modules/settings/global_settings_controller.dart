import 'package:corona_data/app/shared/models/country_model.dart';
import 'package:corona_data/app/shared/repositories/local_storage_interface.dart';
import 'package:corona_data/app/shared/utils/localization/localization_interface.dart';
import 'package:corona_data/app/shared/utils/localization/localization_utils.dart';
import 'package:corona_data/app/shared/utils/theme/theme_interface.dart';
import 'package:corona_data/app/shared/utils/theme/theme_utils.dart';
import 'package:flutter/material.dart';
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
  ObservableFuture<String> localeKey;

  @observable
  ObservableFuture<CountryModel> country;

  @computed
  ITheme get theme {
    return ThemeUtils.getTheme(themeName?.value);
  }
  @computed
  ILocalization get locale {
    return LocalizationUtils.getLocale(localeKey?.value);
  }
  
  @computed
  bool get isReady {
    return themeName.value != null && country.value != null && localeKey.value != null;
  }

  @action
  void init() {
    getTheme();
    getCountry();
    getLocale();
  }

  @computed
  int get isChanged =>
      (country.value.name + themeName.value.toString() + localeKey.value).hashCode;

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
    if (country.code != this.country.value.code) {
      this.country = ObservableFuture.value(country);
      localStorage.setCountry(country);
    }
  }

  @action
  void getCountry() {
    this.country = localStorage.getCountry().asObservable();
  }

  @action
  void setLocale(String localeKey) {
    if (localeKey!= this.localeKey.value) {
      this.localeKey = ObservableFuture.value(localeKey);
      localStorage.setLocale(localeKey);
    }
  }

  @action
  void getLocale() {
    this.localeKey = localStorage.getLocale().asObservable();
  }
  

}





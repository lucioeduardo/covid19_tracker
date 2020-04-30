import 'package:corona_data/app/shared/models/country_model.dart';
import 'package:corona_data/app/shared/repositories/local_storage_interface.dart';
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
  ObservableFuture<CountryModel> country;

  @computed
  ThemeData get theme {
    return ThemeUtils.getThemeData(themeName?.value);
  }

  @computed
  bool get isReady {
    return themeName.value != null && country.value != null;
  }

  @action
  void init() {
    getTheme();
    getCountry();
  }

  @computed
  int get isChanged =>
      (country.value.name + themeName.value.toString()).hashCode;

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

}





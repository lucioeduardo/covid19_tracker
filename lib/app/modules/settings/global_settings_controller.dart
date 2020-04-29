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
  ObservableFuture<bool> themeDark;

  @observable
  ObservableFuture<String> themeName;

  @observable
  ObservableFuture<String> countryName;

  @computed
  ThemeData get theme {
    // if (themeDark == null) {
    //   return _themeDark;
    // }

    // return themeDark.value ? _themeDark : _themeLight;
    return ThemeUtils.getThemeData(themeName?.value);
  }

  @computed
  bool get isReady {
    return themeName.value != null && countryName.value != null;
  }

  @action
  void init() {
    getTheme();
    getCountry();
  }

  @computed
  int get isChanged =>
      (countryName.value + themeName.value.toString()).hashCode;

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
  void setCountry(String country) {
    if (country != countryName.value) {
      countryName = ObservableFuture.value(country);
      localStorage.setCountry(country);
    }
  }

  @action
  void getCountry() {
    countryName = localStorage.getCountry().asObservable();
  }

}





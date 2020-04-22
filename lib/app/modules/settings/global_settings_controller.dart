import 'package:corona_data/app/modules/home/repositories/local_storage_interface.dart';
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
  ObservableFuture<String> countryName;

  

  @computed
  ThemeData get theme {
    if(themeDark==null){
      return _themeDark;
    }

    return themeDark.value ? _themeDark : _themeLight;
  }
  @computed
  bool get isReady {
    return themeDark.value != null && countryName.value != null;
  }

  @action
  void init(){
    getTheme();
    getCountry();
  }

  @computed
  int get isChanged => (countryName.value + themeDark.value.toString()).hashCode;

  @action
  void getTheme() {
    themeDark = localStorage.isThemeDark().asObservable();
  }

  @action
  void setTheme(bool value){
    
    themeDark = ObservableFuture<bool>.value(value);

    localStorage.setTheme(value);
  }

  @action
  void setCountry(String country){
    if(country != countryName.value){
      countryName=ObservableFuture.value(country);  
      localStorage.setCountry(country);
    }
  }

  @action
  void getCountry() {
    countryName = localStorage.getCountry().asObservable();
  }

  final ThemeData _themeLight = ThemeData(
    primaryColor: Color(0xffdcddda),
    primaryColorLight: Color(0xff83867e),
    primaryColorDark: Color(0xffEBE9E7),
    accentColor: Color(0xff231F1C),
    
  );

  final ThemeData _themeDark = ThemeData(
    primaryColor: Color(0xff393e3b),
    primaryColorLight: Color(0xff9C9F98),
    primaryColorDark: Color(0xff231F1C),
    accentColor: Color(0xffEBE9E7),
  );
}

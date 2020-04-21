import 'package:corona_data/app/modules/home/repositories/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  bool themeDark = true;

  @observable
  String countryName = "Brazil";

  @computed
  ThemeData get theme => themeDark ? _themeDark : _themeLight;

  @computed
  int get isChanged => (countryName + themeDark.toString()).hashCode;

  final ILocalStorage localStorage = Modular.get();

  @action
  void setTheme(bool value){
    themeDark = value;

    localStorage.setTheme(value);
  }

  @action
  void setCountry(String country){
    
    countryName = country;

    localStorage.setCountry(country);
  }

  @action
  void getCountry() {
    localStorage.getCountry().then((onValue)=>countryName=onValue);
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

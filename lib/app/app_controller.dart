import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  bool themeDark = true;

  @computed
  ThemeData get theme => themeDark ? _themeDark : _themeLight; 

  _AppControllerBase(){
    this.themeDark = true;
  }

  @action
  void setTheme(){
    themeDark = !themeDark;
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

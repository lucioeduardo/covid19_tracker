import 'package:corona_data/app/modules/country/country_module.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_module.dart';
import 'package:corona_data/app/modules/world/world_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int selectedIndex;
  GlobalSettingsController globalSettingsController = Modular.get();
  
  final _titleName = ["country", "World", "Map"];
  
  @computed
  String get title => _titleName[selectedIndex]=='country'?globalSettingsController.country.name:_titleName[selectedIndex];

  final List<Widget> _pages = [
    CountryModule(),
    WorldModule(),
    StatesMapModule(),
  ];

  @computed
  Widget get page => _pages.elementAt(selectedIndex);

  _HomeControllerBase() {
    selectedIndex = 0;
  }

  @action
  setPage(int index){
    selectedIndex = index;
  }
}

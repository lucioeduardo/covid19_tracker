import 'package:corona_data/app/modules/home/pages/brazil/brazil_page.dart';
import 'package:corona_data/app/modules/home/pages/states_map/states_map_page.dart';
import 'package:corona_data/app/modules/home/pages/world/world_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int selectedIndex;
  
  final titleName = ["Brasil", "Mundo", "Mapa"];
  
  @computed
  String get title => titleName[selectedIndex];

  final List<Widget> pages = [
    BrazilPage(),
    WorldPage(),
    StatesMapPage(),
  ];

  @computed
  Widget get page => pages.elementAt(selectedIndex);

  _HomeControllerBase() {
    selectedIndex = 0;
  }

  @action
  setPage(int index){
    selectedIndex = index;
  }
}

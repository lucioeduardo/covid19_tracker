import 'package:corona_data/app/modules/home/widgets/brazil/brazil_page.dart';
import 'package:corona_data/app/modules/home/widgets/states_map/states_map_widget.dart';
import 'package:corona_data/app/modules/home/widgets/world/world_widget.dart';
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
    BrazilWidget(),
    WorldWidget(),
    StatesMapWidget(),
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

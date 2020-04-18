import 'package:corona_data/app/modules/home/widgets/country/country_widget.dart';
import 'package:corona_data/app/modules/home/widgets/states_map/states_map_widget.dart';
import 'package:corona_data/app/modules/home/widgets/world/world_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int selectedIndex;
  
  final _titleName = ["country", "Mundo", "Mapa"];
  
  @computed
  String get title => _titleName[selectedIndex];

  final List<Widget> _pages = [
    CountryWidget(),
    WorldWidget(),
    StatesMapWidget(),
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

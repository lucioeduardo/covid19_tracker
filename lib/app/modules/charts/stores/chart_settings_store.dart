import 'package:mobx/mobx.dart';
part 'chart_settings_store.g.dart';

class ChartSettingsStore = _ChartSettingsStoreBase with _$ChartSettingsStore;

abstract class _ChartSettingsStoreBase with Store {
  final List<String> options = ['Case', 'Recovered', 'Death'];

  @observable
  bool showCases;

  @observable
  bool showRecovered;

  @observable
  bool showDeaths;

  _ChartSettingsStoreBase(){
    this.showCases=true;
    this.showRecovered=true;
    this.showDeaths=true;
  }

  bool getOption(option) {
    switch (option) {
      case 'Case':
        return this.showCases;
        break;
      case 'Recovered':
        return this.showRecovered;
        break;
      case 'Death':
        return this.showDeaths;
    }
    throw Exception('The option "$option" doesn\'t exist.');
  }

  @action
  void setOption(option) {
    switch (option) {
      case 'Case':
        this.showCases = !this.showCases;
        break;
      case 'Recovered':
        this.showRecovered = !this.showRecovered;
        break;
      case 'Death':
        this.showDeaths = !this.showDeaths;
    }
  }
}
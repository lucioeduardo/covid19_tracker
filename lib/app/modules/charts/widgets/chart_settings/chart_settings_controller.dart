import 'package:mobx/mobx.dart';

part 'chart_settings_controller.g.dart';

class ChartSettingsController = _ChartSettingsControllerBase
    with _$ChartSettingsController;

abstract class _ChartSettingsControllerBase with Store {
  final List<String> options = ['Casos', 'Recuperados', 'Mortes'];

  @observable
  bool showCases;

  @observable
  bool showRecovered;

  @observable
  bool showDeaths;

  _ChartSettingsControllerBase(){
    this.showCases=true;
    this.showRecovered=true;
    this.showDeaths=true;
  }

  bool getOption(option) {
    switch (option) {
      case 'Casos':
        return this.showCases;
        break;
      case 'Recuperados':
        return this.showRecovered;
        break;
      case 'Mortes':
        return this.showDeaths;
    }
    return true;
  }

  @action
  void setOption(option) {
    switch (option) {
      case 'Casos':
        this.showCases = !this.showCases;
        break;
      case 'Recuperados':
        this.showRecovered = !this.showRecovered;
        break;
      case 'Mortes':
        this.showDeaths = !this.showDeaths;
    }
  }
}

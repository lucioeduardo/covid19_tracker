import 'package:mobx/mobx.dart';
part 'chart_settings_controller.g.dart';

class ChartSettingsController = _ChartSettingsControllerBase
    with _$ChartSettingsController;

abstract class _ChartSettingsControllerBase with Store {
  final List<String> options = ['Case', 'Recovered', 'Death'];

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
      case 'Case':
        return this.showCases;
        break;
      case 'Recovered':
        return this.showRecovered;
        break;
      case 'Death':
        return this.showDeaths;
    }
    return true;
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

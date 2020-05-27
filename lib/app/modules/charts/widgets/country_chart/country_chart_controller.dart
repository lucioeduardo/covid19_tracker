import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/modules/charts/interfaces/chart_controller_interface.dart';
import 'package:corona_data/app/modules/charts/interfaces/historical_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'country_chart_controller.g.dart';

class CountryChartController = _CountryChartControllerBase
    with _$CountryChartController;

abstract class _CountryChartControllerBase
    with Store
    implements IChartController {
  @observable
  ObservableFuture<Map<String, List<int>>> graphData;

  final IHistoricalRepository historicalRepository;
  final AppController appController;

  @observable
  String countryName;

  _CountryChartControllerBase(this.historicalRepository, this.appController) {
    //fetchGraphData();
  }

  @action
  setCountryName(String country){
    this.countryName = country;
  }

  @action
  fetchGraphData() {
    graphData = historicalRepository
        .getCountryHistoricalData(countryName)
        .asObservable();
  }
}

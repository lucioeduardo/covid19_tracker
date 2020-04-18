import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/modules/home/repositories/historical_repository.dart';
import 'package:mobx/mobx.dart';

part 'country_cases_controller.g.dart';

class CountryCasesController = _CountryCasesControllerBase
    with _$CountryCasesController;

abstract class _CountryCasesControllerBase with Store {
  @observable
  ObservableFuture<List<int>> graphData;

  final HistoricalRepository historicalRepository;
  final AppController appController;

  _CountryCasesControllerBase(this.historicalRepository, this.appController){
    fetchGraphData();
  }

  @action
  fetchGraphData(){
    graphData = historicalRepository.getCountryHistorical(appController.countryName).asObservable();
  }
}

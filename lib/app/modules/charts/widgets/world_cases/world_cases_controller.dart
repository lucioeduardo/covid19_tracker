import 'package:corona_data/app/modules/charts/interfaces/chart_controller_interface.dart';
import 'package:corona_data/app/modules/charts/repositories/historical_repository.dart';
import 'package:mobx/mobx.dart';


part 'world_cases_controller.g.dart';

class WorldCasesController = _WorldCasesControllerBase
    with _$WorldCasesController;

abstract class _WorldCasesControllerBase with Store implements IChartController {
  
  @observable
  ObservableFuture<Map<String, List<int>>> graphData;

  final HistoricalRepository historicalRepository;

  _WorldCasesControllerBase(this.historicalRepository){
    print("W---");
    fetchGraphData();
  }

  @action
  fetchGraphData(){
    graphData = historicalRepository.getWorldHistoricalData().asObservable();
  }
}

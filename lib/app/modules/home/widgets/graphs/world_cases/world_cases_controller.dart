import 'package:corona_data/app/modules/home/repositories/historical_repository.dart';
import 'package:mobx/mobx.dart';

import '../chart_controller_interface.dart';

part 'world_cases_controller.g.dart';

class WorldCasesController = _WorldCasesControllerBase
    with _$WorldCasesController;

abstract class _WorldCasesControllerBase with Store implements IChartController {
  
  @observable
  ObservableFuture<List<int>> graphData;

  final HistoricalRepository historicalRepository;

  _WorldCasesControllerBase(this.historicalRepository){
    fetchGraphData();
  }

  @action
  fetchGraphData(){
    graphData = historicalRepository.getWorldHistoricalData().asObservable();
  }
}

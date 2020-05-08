import 'package:corona_data/app/modules/charts/interfaces/chart_controller_interface.dart';
import 'package:corona_data/app/modules/charts/repositories/historical_repository.dart';
import 'package:mobx/mobx.dart';

part 'state_chart_controller.g.dart';

class StateChartController = _StateChartControllerBase
    with _$StateChartController;

abstract class _StateChartControllerBase with Store implements IChartController {
  @observable
  ObservableFuture<Map<String, List<int>>> graphData;
  @observable
  String state;


  final HistoricalRepository historicalRepository;

  _StateChartControllerBase(this.historicalRepository);

  @action
  setStateName(String state){
    this.state = state;
  }

  @action
  fetchGraphData() {
    graphData = historicalRepository
        .getStateHistoricalData(state)
        .asObservable();
  }
}

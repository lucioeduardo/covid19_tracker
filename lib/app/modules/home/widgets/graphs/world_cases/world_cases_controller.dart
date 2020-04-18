import 'package:corona_data/app/modules/home/repositories/historical_repository.dart';
import 'package:corona_data/app/shared/models/historical_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'world_cases_controller.g.dart';

class WorldCasesController = _WorldCasesControllerBase
    with _$WorldCasesController;

abstract class _WorldCasesControllerBase with Store {
  
  @observable
  ObservableFuture<List<int>> graphData;

  HistoricalRepository historicalRepository = Modular.get();

  _WorldCasesControllerBase(){
    fetchGraphData();
  }

  @action
  fetchGraphData(){
    graphData = historicalRepository.getWorldHistorical(30).asObservable();
  }
}

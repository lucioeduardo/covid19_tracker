import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'world_controller.g.dart';

class WorldController = _WorldControllerBase with _$WorldController;

abstract class _WorldControllerBase with Store {
  final ICovidRepository covidRepository;

  @observable
  ObservableFuture<InfoModel> worldInfo;

  _WorldControllerBase(this.covidRepository){
    fetchWorldInfo();
  }

  @action
  fetchWorldInfo(){
    worldInfo = covidRepository.worldInfo().asObservable();
  }

}

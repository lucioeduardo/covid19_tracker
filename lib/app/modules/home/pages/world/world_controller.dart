import 'package:corona_data/app/modules/home/repositories/covid_repository.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:mobx/mobx.dart';

part 'world_controller.g.dart';

class WorldController = _WorldControllerBase with _$WorldController;

abstract class _WorldControllerBase with Store {
  final CovidRepository covidRepository;

  @observable
  ObservableFuture<InfoModel> worldInfo;

  _WorldControllerBase(this.covidRepository){
    worldInfo = covidRepository.worldInfo().asObservable();
  }

}

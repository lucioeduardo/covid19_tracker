import 'package:corona_data/app/modules/home/repositories/covid_repository.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:mobx/mobx.dart';

part 'brazil_controller.g.dart';

class BrazilController = _BrazilControllerBase with _$BrazilController;

abstract class _BrazilControllerBase with Store {
  final CovidRepository covidRepository;

  @observable
  ObservableFuture<InfoModel> brazilInfo;

  _BrazilControllerBase(this.covidRepository){
    fetchBrazilInfo();
    //brazilInfo = covidRepository.brazilInfo().asObservable();
  }

  @action
  fetchBrazilInfo(){
    brazilInfo = covidRepository.brazilInfo().asObservable();
  }
}

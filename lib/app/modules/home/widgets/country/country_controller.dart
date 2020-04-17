import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:mobx/mobx.dart';

part 'country_controller.g.dart';

class CountryController = _CountryControllerBase with _$CountryController;

abstract class _CountryControllerBase with Store {
  final ICovidRepository covidRepository;
  final AppController appController;

  @observable
  ObservableFuture<InfoModel> countryInfo;

  _CountryControllerBase(this.covidRepository,this.appController){
    print("CControl");
    fetchCountryInfo();
    reaction((_)=>appController.countryName,(_){
      
      fetchCountryInfo();
    }

    );
  }

  @action
  fetchCountryInfo(){
    countryInfo = covidRepository.countryInfo(appController.countryName).asObservable();
  }
}

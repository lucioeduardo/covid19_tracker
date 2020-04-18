import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'country_controller.g.dart';

class CountryController = _CountryControllerBase with _$CountryController;

abstract class _CountryControllerBase with Store implements Disposable {
  final ICovidRepository covidRepository;
  final AppController appController;
  ReactionDisposer disposer;

  @observable
  ObservableFuture<InfoModel> countryInfo;

  _CountryControllerBase(this.covidRepository,this.appController){
    
    
    fetchCountryInfo();
    disposer=reaction((_)=>appController.countryName,(_){
      
      fetchCountryInfo();
    }

    );
  }

  @action
  fetchCountryInfo(){
    print(appController.countryName);
    countryInfo = covidRepository.countryInfo(appController.countryName).asObservable();
    print(appController.countryName+"1");
  }

  @override
  void dispose() {
    disposer();
  }

  
}

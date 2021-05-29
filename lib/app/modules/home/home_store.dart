import 'package:mobx/mobx.dart';
import 'package:projeto_pp/app/models/info_model.dart';
import 'package:projeto_pp/app/shared/repositories/covid_repository_interface.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  String searchString = "";

  @observable
  ObservableFuture<List<InfoModel>> countriesData;

  final ICovidRepository covidRepository;

  HomeStoreBase(this.covidRepository){
    
    this.fetchData();
  }

  @action
  changeSearchString(String value){
    this.searchString = value.toLowerCase();
  }

  @action
  fetchData() {
    countriesData = covidRepository.countriesInfo().asObservable();
  }

}
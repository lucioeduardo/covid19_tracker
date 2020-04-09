import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/models/state_model.dart';

class CovidRepositoryMock implements ICovidRepository {
  @override
  Future<InfoModel> brazilInfo() {
    return Future.value(InfoModel(
        cases: 555,
        deaths: 100,
        affectedCountries: 300,
        critical: 50,
        recovered: 10,
        todayCases: 8,
        todayDeaths: 5));
  }

  @override
  Future<List<StateModel>> getStatesInfo() {
    return Future.value([
      StateModel(confirmed: 15, deaths: 3, state: 'AL'),
      StateModel(confirmed: 50, deaths: 20, state: 'PE'),
    ]);
  }

  @override
  Future<InfoModel> worldInfo() {
    return Future.value(InfoModel(
        cases: 555,
        deaths: 100,
        affectedCountries: 300,
        critical: 50,
        recovered: 10,
        todayCases: 8,
        todayDeaths: 5));
  }
}

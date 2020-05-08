import 'package:corona_data/app/shared/models/city_model.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:mockito/mockito.dart';

class CovidRepositoryMock extends Mock implements ICovidRepository {
  CovidRepositoryMock() {
    InfoModel defaultModel = InfoModel(
        cases: 555,
        deaths: 100,
        affectedCountries: 300,
        critical: 50,
        recovered: 10,
        todayCases: 8,
        todayDeaths: 5);

    when(this.countryInfo("Brazil")).thenAnswer(
      (_) async => Future.value(defaultModel),
    );

    when(this.worldInfo()).thenAnswer(
      (_) async => Future.value(defaultModel),
    );

    when(this.getStatesInfo()).thenAnswer(
      (_) async => Future.value(
        Future.value([
          StateModel(confirmed: 10, deaths: 2, state: 'AL'),
          StateModel(confirmed: 15, deaths: 3, state: 'PE'),
        ]),
      ),
    );
    when(this.getCitiesInfo()).thenAnswer(
      (_) async => Future.value(
        Future.value([
          CityModel(confirmed: 10, deaths: 2, city: 'Arapiraca'),
          CityModel(confirmed: 15, deaths: 3, city: 'Palmeira'),
        ]),
      ),
    );
  }
}

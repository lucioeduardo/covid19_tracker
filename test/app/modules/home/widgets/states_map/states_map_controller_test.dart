import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/modules/home/widgets/states_map/states_map_controller.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/mockito.dart';

class CovidRepositoryMock extends Mock implements ICovidRepository {}

void main() {
  initModule(AppModule());

  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();
  when(covidRepositoryMock.getStatesInfo()).thenAnswer((_) => Future.value([
    StateModel(confirmed: 10, deaths: 2, state: 'AL'),
    StateModel(confirmed: 15, deaths: 3, state: 'PE'),
  ]));

  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);

  StatesMapController statesmap;

  setUp(() {
    statesmap = Modular.get();
  });

  group('StatesMapController Test', () {
      test("Getting markers", () async{
        await statesmap.markers;
        expect(statesmap.markers.value.length, 2);
        expect(statesmap.markers.value, isInstanceOf<Set<Marker>>());
      });
  });
}

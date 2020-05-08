import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_module.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:corona_data/app/modules/home/home_module.dart';

import '../../mocks/covid_repository_mock.dart';

void main() {
  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();

  initModule(AppModule());
  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);
  initModule(StatesMapModule());

  StatesMapController statesmap;

  setUp(() {
    statesmap = Modular.get();
  });

  group('StatesMapController Test', () {
    test("Getting markers", () async {
      expect(statesmap.statesData.value.length, 2);
      
      expect(statesmap.statesData.value, isInstanceOf<List<IMarkerModelData>>());
      expect(statesmap.markers, isInstanceOf<Map<Marker,IMarkerModelData>>());
    });
  });
}

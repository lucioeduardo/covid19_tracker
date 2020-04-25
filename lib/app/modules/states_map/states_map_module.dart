import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:corona_data/app/modules/states_map/states_map_page.dart';

class StatesMapModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => StatesMapController(i.get<ICovidRepository>())),
      ];

  static Inject get to => Inject<StatesMapModule>.of();

  @override
  Widget get view => StatesMapPage();
}

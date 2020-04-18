import 'package:corona_data/app/modules/home/widgets/graphs/world_cases/world_cases_controller.dart';
import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/modules/home/home_controller.dart';
import 'package:corona_data/app/modules/home/home_page.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository_interface.dart';

import 'package:corona_data/app/modules/home/widgets/country/country_controller.dart';
import 'package:corona_data/app/modules/home/repositories/historical_repository.dart';

import 'package:corona_data/app/modules/home/widgets/country/country_controller.dart';
import 'package:corona_data/app/modules/home/widgets/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/home/widgets/world/world_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WorldCasesController()),
        Bind((i) => StatesMapController(Modular.get<ICovidRepository>())),
        Bind((i) => HomeController()),
        Bind<ICovidRepository>((i) => CovidRepository(i.get()),),

        Bind((i) => CountryController(Modular.get<ICovidRepository>(),Modular.get<AppController>())),
        Bind((i) => WorldController(Modular.get<ICovidRepository>())),
        Bind((i) => HistoricalRepository(i.get())),
      ];

  @override
  List<Router> get routers => [Router("/", child: (_, args) => HomePage())];

  static Inject get to => Inject<HomeModule>.of();
}

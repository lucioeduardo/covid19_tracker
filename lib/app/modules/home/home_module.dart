import 'package:corona_data/app/modules/home/pages/states_map/states_map_controller.dart';
import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/home_controller.dart';
import 'package:corona_data/app/modules/home/home_page.dart';
import 'package:corona_data/app/modules/home/pages/brazil/brazil_controller.dart';
import 'package:corona_data/app/modules/home/pages/world/world_controller.dart';
import 'package:corona_data/app/modules/home/repositories/covid_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => StatesMapController(Modular.get<CovidRepository>())),
        Bind((i) => HomeController()),
        Bind((i) => CovidRepository(Modular.get<Dio>()),),

        Bind((i) => BrazilController(Modular.get<CovidRepository>())),
        Bind((i) => WorldController(Modular.get<CovidRepository>())),
      ];

  @override
  List<Router> get routers => [Router("/", child: (_, args) => HomePage())];

  static Inject get to => Inject<HomeModule>.of();
}

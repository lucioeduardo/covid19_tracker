import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/home_controller.dart';
import 'package:corona_data/app/modules/home/home_page.dart';
import 'package:corona_data/app/modules/home/pages/brazil/brazil_controller.dart';
import 'package:corona_data/app/modules/home/pages/world/world_controller.dart';
import 'package:corona_data/app/shared/repositories/covid_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => BrazilController(AppModule.to.get<CovidRepository>())),
        Bind((i) => WorldController(AppModule.to.get<CovidRepository>())),
      ];

  @override
  List<Router> get routers => [
    Router("/", child: (_,args) => HomePage())
  ];

  static Inject get to => Inject<HomeModule>.of();
}

import 'package:corona_data/app/modules/home/home_controller.dart';
import 'package:corona_data/app/modules/home/home_page.dart';
import 'package:corona_data/app/shared/repositories/covid_repository.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';


import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind<ICovidRepository>(
          (i) => CovidRepository(i.get()),
        ),
      ];

  @override
  List<Router> get routers => [Router("/", child: (_, args) => HomePage())];

  static Inject get to => Inject<HomeModule>.of();
}

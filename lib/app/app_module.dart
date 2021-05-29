import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_pp/app/modules/country/country_module.dart';
import 'package:projeto_pp/app/shared/repositories/covid_repository.dart';
import 'package:projeto_pp/app/shared/repositories/covid_repository_interface.dart';

import 'modules/home/home_module.dart';
import 'shared/constants.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => Dio(BaseOptions(baseUrl: BASE_URL)),
    ),
    Bind<ICovidRepository>(
      (i) => CovidRepository(i.get()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/country', module: CountryModule()),
  ];
}

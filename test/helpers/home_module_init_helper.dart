import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app/mocks/covid_repository_mock.dart';
import 'app_module_init_helper.dart';
import 'module_helper_base.dart';


class InitHomeModuleHelper extends ModuleHelperBase {
  @override
  List<Bind> binds() {
    CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();
    return [
      Bind<ICovidRepository>((i) => covidRepositoryMock),
    ];
  }

  @override
  ChildModule module() {
    return HomeModule();
  }

  @override
  List<ModuleHelperBase> modularDependencies() {
    return [InitAppModuleHelper()];
  }
}

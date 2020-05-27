import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app/mocks/local_storage_mock.dart';
import 'module_helper_base.dart';

class InitAppModuleHelper extends ModuleHelperBase {
  
  @override
  List<Bind> binds() {
    LocalStorageMock localStorageMock = LocalStorageMock();
    return [
      Bind<ILocalStorage>((i) => localStorageMock),
    ];
  }

  @override
  ChildModule module() {
    return AppModule();
  }

  @override
  List<ModuleHelperBase> modularDependencies() {
    return [];
  }

  
}

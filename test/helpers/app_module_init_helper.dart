import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app/mocks/local_storage_mock.dart';
import 'modular_test_interface.dart';


class InitAppModuleHelper extends IModularTest {


  final ModularTestType modularTestType;
  InitAppModuleHelper({this.modularTestType: ModularTestType.resetModule});

  @override
  List<Bind> binds() {
    ILocalStorage localStorageMock = LocalStorageMock();
    
    return [
      Bind<ILocalStorage>((i) => localStorageMock),
    ];
  }

  @override
  ChildModule module() {
    return AppModule();
  }

  @override
  IModularTest modulardependency() {
    return null;
  }

  
}

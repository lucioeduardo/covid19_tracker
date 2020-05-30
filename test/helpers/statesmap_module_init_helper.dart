import 'package:corona_data/app/modules/states_map/states_map_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_module_init_helper.dart';
import 'modular_test_interface.dart';

class InitStatesMapModuleHelper extends IModularTest {
  final ModularTestType modularTestType;

  InitStatesMapModuleHelper(
      {this.modularTestType = ModularTestType.resetModule})
      : super(modularTestType: modularTestType);


  @override
  List<Bind> binds() {
    return [];
  }

  @override
  ChildModule module() {
    return StatesMapModule();
  }

  @override
  IModularTest modulardependency() {
    return 
      InitHomeModuleHelper();
  }

}

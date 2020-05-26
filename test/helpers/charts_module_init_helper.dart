import 'package:corona_data/app/modules/charts/charts_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_module_init_helper.dart';
import 'module_helper_base.dart';

class InitChartsModuleHelper extends ModuleHelperBase {
  @override
  List<Bind> binds() {
    return [];
  }

  @override
  ChildModule module() {
    Widget widget;
    return ChartsModule(widget);
  }

  @override
  List<ModuleHelperBase> modularDependencies() {
    return [InitHomeModuleHelper()];
  }
}

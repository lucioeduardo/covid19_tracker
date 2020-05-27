import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

enum ModularTestType { resetModule, keepModulesOnMemory }

abstract class ModuleHelperBase {
  final ModularTestType modularTestType;
  ModuleHelperBase({this.modularTestType: ModularTestType.resetModule});

  ChildModule module();
  List<Bind> binds();
  List<ModuleHelperBase> modularDependencies();

  void load({
    List<ModuleHelperBase> dependencies,
    List<Bind> changeBinds,
    bool isLoadDependencies = true,
  }) {
    dependencies ??= this.modularDependencies();
    changeBinds ??= this.binds();
    
    assert(
      !_isDependenciesRequired(dependencies, isLoadDependencies),
      "Dependencies must not be null when isLoadDependencies is true",
    );
    assert(
      changeBinds != null,
      "changeBinds must not be null",
    );

    _memoryManage();
    this._loadModularDependencies(isLoadDependencies, dependencies);
    initModule(
      this.module(),
      changeBinds: changeBinds,
    );
  }

  bool _isDependenciesRequired(List<ModuleHelperBase> dependencies, bool isLoadDependencies) => dependencies == null && isLoadDependencies;

  void _memoryManage() {
    if (this.modularTestType == ModularTestType.resetModule)
      Modular.removeModule(this.module());
  }

  void _loadModularDependencies(
    bool isLoadDependencies,
    List<ModuleHelperBase> dependencies,
  ) {
    if (isLoadDependencies) {
      dependencies.forEach((element) {
        element.load();
      });
    }
  }

  List<Bind> _loadChangeBinds(List<Bind> changeBinds) =>
      changeBinds.isEmpty ? changeBinds : this.binds();
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

abstract class ModuleHelperBase {
  ChildModule module();
  List<Bind> binds();
  List<ModuleHelperBase> modularDependencies();

  void load({
    List<ModuleHelperBase> dependencies,
    List<Bind> changeBinds,
    bool isLoadDependencies = true,
  }) {
    this._loadModularDependencies(isLoadDependencies, dependencies);
    initModule(
      this.module(),
      changeBinds: this._loadChangeBinds(changeBinds),
    );
  }

  void _loadModularDependencies(
      bool isLoadDependencies, List<ModuleHelperBase> dependencies) {
    if (isLoadDependencies != null && isLoadDependencies) {
      try {
        final loadDependencies =
            dependencies != null ? dependencies : this.modularDependencies();
        loadDependencies.forEach((element) {
          element.load();
        });
      } catch (e) {}
    }
  }

  List<Bind> _loadChangeBinds(List<Bind> changeBinds) =>
      changeBinds != null ? changeBinds : this.binds();
}

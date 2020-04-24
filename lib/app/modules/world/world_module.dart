import 'package:corona_data/app/modules/world/world_controller.dart';
import 'package:corona_data/app/modules/world/world_page.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WorldModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => WorldController(i.get<ICovidRepository>())),
      ];

  static Inject get to => Inject<WorldModule>.of();

  @override
  Widget get view => WorldPage();
}

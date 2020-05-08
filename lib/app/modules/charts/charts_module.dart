import 'package:corona_data/app/modules/charts/widgets/state_chart/state_chart_controller.dart';
import 'package:corona_data/app/modules/charts/widgets/chart_settings/chart_settings_controller.dart';
import 'package:corona_data/app/modules/charts/repositories/historical_repository.dart';
import 'package:corona_data/app/modules/charts/repositories/historical_repository_interface.dart';
import 'package:corona_data/app/modules/charts/widgets/country_cases/country_cases_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_controller.dart';
import 'widgets/world_cases/world_cases_controller.dart';

class ChartsModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => StateChartController(i.get<IHistoricalRepository>())),
        Bind((i) => ChartSettingsController()),
        Bind((i) => CountryCasesController(
            i.get<IHistoricalRepository>(), i.get<AppController>())),
        Bind((i) => WorldCasesController(i.get<IHistoricalRepository>())),
        Bind<IHistoricalRepository>((i) => HistoricalRepository(i.get())),
      ];

  static Inject get to => Inject<ChartsModule>.of();

  final Widget widget;
  ChartsModule(this.widget);

  @override
  Widget get view => widget;
}

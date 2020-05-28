import 'interfaces/historical_repository_interface.dart';
import 'stores/chart_settings_store.dart';
import 'widgets/city_chart/city_chart_controller.dart';
import 'widgets/country_chart/country_chart_controller.dart';
import 'widgets/state_chart/state_chart_controller.dart';
import 'repositories/historical_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_controller.dart';
import 'widgets/world_chart/world_chart_controller.dart';

class ChartsModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CityChartController(i.get<IHistoricalRepository>())),
        Bind((i) => StateChartController(i.get<IHistoricalRepository>())),
        Bind((i) => ChartSettingsStore()),
        Bind((i) => CountryChartController(
            i.get<IHistoricalRepository>(), i.get<AppController>())),
        Bind((i) => WorldChartController(i.get<IHistoricalRepository>())),
        Bind<IHistoricalRepository>((i) => HistoricalRepository(i.get())),
      ];

  static Inject get to => Inject<ChartsModule>.of();

  final Widget widget;
  ChartsModule(this.widget);

  @override
  Widget get view => widget;
}

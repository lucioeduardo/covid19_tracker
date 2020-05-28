import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:corona_data/app/shared/utils/localization/i18n/base_translation_extension.i18n.dart';

import 'world_chart_controller.dart';


class WorldChartWidget extends StatefulWidget {
  @override
  _WorldChartWidgetState createState() => _WorldChartWidgetState();
}

class _WorldChartWidgetState
    extends ModularState<WorldChartWidget, WorldChartController> {
      
  @override
  Widget build(BuildContext context) {
    return ChartsPage(
      controller: controller,
      title: "World".i18n,
    );
  }
}

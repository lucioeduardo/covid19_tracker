import 'package:corona_data/app/modules/charts/widgets/state_chart/state_chart_controller.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../charts_page.dart';

class StateChartWidget extends StatefulWidget {
  final String stateName;

  const StateChartWidget({Key key, @required this.stateName}) : super(key: key);

  @override
  _StateChartWidgetState createState() => _StateChartWidgetState();
}

class _StateChartWidgetState extends ModularState<StateChartWidget, StateChartController> {

  @override
  void initState() {
    super.initState();
    controller.setStateName(widget.stateName);
    controller.fetchGraphData();
  }

  @override
  Widget build(BuildContext context) {
    return ChartsPage(controller: controller, hasRecoveredData: false, title: stateName[widget.stateName],);
  }
}

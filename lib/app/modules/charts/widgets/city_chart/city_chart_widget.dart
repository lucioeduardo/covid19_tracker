import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:corona_data/app/modules/charts/widgets/city_chart/city_chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CityChartWidget extends StatefulWidget {
  final String cityCode;

  const CityChartWidget({Key key, @required this.cityCode}) : super(key: key);

  @override
  _CityChartWidgetState createState() => _CityChartWidgetState();
}

class _CityChartWidgetState
    extends ModularState<CityChartWidget, CityChartController> {
  @override
  void initState() {
    super.initState();
    controller.setCityCode(widget.cityCode);
    controller.fetchGraphData();
  }

  @override
  Widget build(BuildContext context) {
    return ChartsPage(
      controller: controller,
      hasRecoveredData: false,
    );
  }
}

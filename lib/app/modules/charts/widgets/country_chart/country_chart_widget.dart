import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'country_chart_controller.dart';

class CountryChartWidget extends StatefulWidget {
  final String countryName;

  const CountryChartWidget({Key key, @required this.countryName}) : super(key: key);

  @override
  _CountryChartWidgetState createState() => _CountryChartWidgetState();
}

class _CountryChartWidgetState
    extends ModularState<CountryChartWidget, CountryChartController> {
  
  @override
  void initState() {
    super.initState();
    controller.setCountryName(widget.countryName);
    controller.fetchGraphData();
  }

  @override
  Widget build(BuildContext context) {
    return ChartsPage(controller: controller, title: widget.countryName,);
  }
}

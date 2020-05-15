import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'country_cases_controller.dart';

class CountryCasesGraphWidget extends StatefulWidget {
  final String countryName;

  const CountryCasesGraphWidget({Key key, @required this.countryName}) : super(key: key);

  @override
  _CountryCasesGraphWidgetState createState() => _CountryCasesGraphWidgetState();
}

class _CountryCasesGraphWidgetState
    extends ModularState<CountryCasesGraphWidget, CountryCasesController> {
  
  @override
  Widget build(BuildContext context) {
    return ChartsPage(controller: controller, title: widget.countryName,);
  }
}

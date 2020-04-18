import 'package:corona_data/app/modules/home/widgets/graphs/country_cases/country_cases_controller.dart';
import 'package:corona_data/app/modules/home/widgets/graphs/handle_graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CountryCasesGraphWidget extends StatefulWidget {
  @override
  _CountryCasesGraphWidgetState createState() => _CountryCasesGraphWidgetState();
}

class _CountryCasesGraphWidgetState
    extends ModularState<CountryCasesGraphWidget, CountryCasesController> {

  @override
  Widget build(BuildContext context) {
    return HandleGraphWidget(controller: controller);
  }
}

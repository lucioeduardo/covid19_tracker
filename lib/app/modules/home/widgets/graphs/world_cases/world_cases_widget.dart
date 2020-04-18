import 'package:corona_data/app/modules/home/widgets/graphs/handle_graph_widget.dart';
import 'package:corona_data/app/modules/home/widgets/graphs/world_cases/world_cases_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class WorldCasesGraphWidget extends StatefulWidget {
  @override
  _WorldCasesGraphWidgetState createState() => _WorldCasesGraphWidgetState();
}

class _WorldCasesGraphWidgetState
    extends ModularState<WorldCasesGraphWidget, WorldCasesController> {

  @override
  Widget build(BuildContext context) {
    return HandleGraphWidget(controller: controller);  }
}

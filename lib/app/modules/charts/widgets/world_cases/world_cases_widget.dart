import 'package:corona_data/app/modules/charts/charts_page.dart';
import 'package:corona_data/app/modules/charts/widgets/world_cases/world_cases_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:corona_data/app/shared/utils/localization/i18n/base_translation_extension.i18n.dart';


class WorldCasesGraphWidget extends StatefulWidget {
  @override
  _WorldCasesGraphWidgetState createState() => _WorldCasesGraphWidgetState();
}

class _WorldCasesGraphWidgetState
    extends ModularState<WorldCasesGraphWidget, WorldCasesController> {
      
  @override
  Widget build(BuildContext context) {
    return ChartsPage(
      controller: controller,
      title: "World".i18n,
    );
  }
}

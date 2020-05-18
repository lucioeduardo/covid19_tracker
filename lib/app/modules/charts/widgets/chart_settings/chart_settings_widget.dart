import 'package:corona_data/app/modules/charts/widgets/chart_settings/chart_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../i18n/charts_page.i18n.dart';

class ChartSettingsWidget extends StatefulWidget {
  @override
  _ChartSettingsWidgetState createState() => _ChartSettingsWidgetState();
}

class _ChartSettingsWidgetState
    extends ModularState<ChartSettingsWidget, ChartSettingsController> {
  PopupMenuItem<String> generatePopupMenu(value, onChanged, option) {
    return CheckedPopupMenuItem<String>(
      value: option,
      checked: value,
      child: Text(option),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        FontAwesomeIcons.ellipsisV,
        color: Theme.of(context).primaryColorLight,
      ),
      onSelected: controller.setOption,
      itemBuilder: (context) {
        return controller.options.map((option) =>
          CheckedPopupMenuItem<String>(
            value: option,
            checked: controller.getOption(option),
            child: Text(option.plural(2)),
          )
        ).toList();
      },
    );
  }
}

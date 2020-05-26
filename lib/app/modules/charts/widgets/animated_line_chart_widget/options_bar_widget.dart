import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../chart_settings/chart_settings_widget.dart';

class OptionsBarWidget extends StatelessWidget {
  const OptionsBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          color: Theme.of(context).primaryColorLight,
          icon: Icon(
            FontAwesomeIcons.times,
          ),
          onPressed: Navigator.of(context).pop,
        ),
        ChartSettingsWidget(),
      ],
    );
  }
}
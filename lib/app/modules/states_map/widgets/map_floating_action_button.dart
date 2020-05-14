import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapFloatingActionButton extends StatelessWidget {
  const MapFloatingActionButton({
    Key key,
    @required this.controller,
    @required this.globalSettingsController,
    // @required this.controller,
  }) : super(key: key);

  // final StatesMapController controller;
  final GlobalSettingsController globalSettingsController;
  final StatesMapController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        controller.toggleActiveCluster();
      },
      backgroundColor: globalSettingsController.theme.themeData.primaryColor,
      child: FaIcon(
        controller.isActiveCluster
            ? FontAwesomeIcons.toggleOn
            : FontAwesomeIcons.toggleOff,
        color: globalSettingsController.theme.themeData.accentColor,
      ),
    );
  }
}
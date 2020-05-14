import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/states_map/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapFloatingActionButton extends StatefulWidget {
  MapFloatingActionButton({
    Key key,
    @required this.controller,
    @required this.globalSettingsController,
    @required this.mapController,
  }) : super(key: key);

  final GlobalSettingsController globalSettingsController;
  final StatesMapController controller;
  final MapController mapController;

  @override
  _MapFloatingActionButtonState createState() =>
      _MapFloatingActionButtonState();
}

class _MapFloatingActionButtonState extends State<MapFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = widget.globalSettingsController.theme.themeData;
    return Observer(
        builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: "zoom_plus",
                  onPressed: () {
                    widget.mapController.move(kDefaultLatLong, kDefaultZoom);
                  },
                  backgroundColor:
                      widget.controller.markerShowed == MarkersType.states
                          ? themeData.accentColor
                          : themeData.primaryColor,
                  child: FaIcon(
                    FontAwesomeIcons.searchMinus,
                    color:widget.controller.markerShowed == MarkersType.states
                          ? themeData.primaryColor
                          : themeData.accentColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: FloatingActionButton(
                    heroTag: 'cluster_active',
                    onPressed: () {
                      widget.controller.toggleActiveCluster();
                    },
                    backgroundColor: widget
                        .globalSettingsController.theme.themeData.primaryColor,
                    child: FaIcon(
                      widget.controller.isActiveCluster
                          ? FontAwesomeIcons.toggleOn
                          : FontAwesomeIcons.toggleOff,
                      color: widget
                          .globalSettingsController.theme.themeData.accentColor,
                    ),
                  ),
                ),
              ],
            ));
  }
}

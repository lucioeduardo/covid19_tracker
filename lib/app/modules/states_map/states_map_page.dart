import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/map_tooltip_widget.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:latlong/latlong.dart';
import 'package:mobx/mobx.dart';

import 'states_map_controller.dart';

class StatesMapPage extends StatefulWidget {
  final String title;
  const StatesMapPage({Key key, this.title = "StatesMap"}) : super(key: key);

  @override
  _StatesMapPageState createState() => _StatesMapPageState();
}

class _StatesMapPageState
    extends ModularState<StatesMapPage, StatesMapController> {
  final PopupController _popupController = PopupController();
  final GlobalSettingsController globalSettingsController = Modular.get();
  final MapController mapController = MapController();
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();

    disposer = reaction(
        (_) => controller.markerShowed, (_) => _popupController.hidePopup());
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (controller.statesData.error != null ||
          controller.citiesData.error != null) {
        return TryAgainWidget(onPressed: controller.fetchStatesData);
      }

      List<IMarkerModelData> states = controller.markersData;

      if (states == null) {
        return Center(
            child: Container(
          width: 150,
          height: 150,
          child: VirusCircularAnimation(
            animation: VirusAnimation.rotation_fast,
            fit: BoxFit.contain,
            size: AnimationSizes.large,
          ),
        ));
      }

      return FlutterMap(
        mapController: mapController,
        options: MapOptions(
          onPositionChanged: (position, value) {
            if (position.zoom >= 8.0) {
              controller.setMarkerShowed(MarkersType.cities);
            } else {
              controller.setMarkerShowed(MarkersType.states);
            }
          },
          center: LatLng(-13.516151006814436, -54.849889911711216),
          zoom: 3.789821910858154,
          minZoom: 3.5,
          onTap: (a) {
            _popupController.hidePopup();
          },
          plugins: [
            MarkerClusterPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            tileProvider: CachedNetworkTileProvider(),
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 50,
            size: Size(30, 30),
            anchor: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: controller.markers.keys.toList(),
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            popupOptions: PopupOptions(
              popupSnap: PopupSnap.top,
              popupController: _popupController,
              popupBuilder: (_, marker) {
                return MapTooltipWidget(stateModel: controller.markers[marker]);
              },
            ),
            builder: (context, markers) {
              return FloatingActionButton(
                heroTag: UniqueKey(),
                backgroundColor:
                    globalSettingsController.theme.themeData.primaryColor,
                child: Text(
                  markers.length.toString(),
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                onPressed: null,
              );
            },
          ),
        ],
      );
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}

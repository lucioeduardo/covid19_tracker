import 'package:corona_data/app/modules/charts/charts_module.dart';
import 'package:corona_data/app/modules/charts/widgets/city_chart/city_chart_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/state_chart/state_chart_widget.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/states_map/utils/constants.dart';
import 'package:corona_data/app/modules/states_map/widgets/map_tooltip_widget.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/utils/modal_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class CoronaMap extends StatelessWidget {
  const CoronaMap({
    Key key,
    @required this.mapController,
    @required this.globalSettingsController,
    @required this.controller,
    @required this.popupController,
    @required this.runtimeType,
    this.focusNode,
  }) :
        super(key: key);

  final MapController mapController;
  final GlobalSettingsController globalSettingsController;
  final StatesMapController controller;
  final PopupController popupController;
  final Type runtimeType;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        interactive: true,
        onPositionChanged: onPositionChanged,
        center: kDefaultLatLong,
        zoom: kDefaultZoom,
        minZoom: 3.5,
        onTap: onTap,
        plugins: [
          MarkerClusterPlugin(),
        ],
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            tileProvider: CachedNetworkTileProvider(),
            backgroundColor:
                globalSettingsController.theme.themeData.primaryColor),
        MarkerClusterLayerOptions(
            animationsOptions: AnimationsOptions(
                fitBound: Duration(seconds: 1), spiderfy: Duration(seconds: 1)),
            showPolygon: false,
            maxClusterRadius: controller.maxClusterRadius,
            size: Size(30, 30),
            anchor: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(
                  controller.markerShowed == MarkersType.cities ? 40 : 100),
            ),
            markers: controller.markersShowed.keys.toList(),
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            popupOptions: PopupOptions(
              popupSnap: PopupSnap.top,
              popupController: popupController,
              popupBuilder: (_, marker) {
                IMarkerModelData stateModel = controller.markersShowed[marker];
                return MapTooltipWidget(
                  stateModel: stateModel,
                  onTap: () => ModalUtils.showModal(
                    context,
                    stateModel.runtimeType == StateModel
                        ? ChartsModule(StateChartWidget(
                            stateName: stateModel.key,
                          ))
                        : ChartsModule(CityChartWidget(
                            cityName: stateModel.title,
                            cityCode: stateModel.key,
                          )),
                  ),
                );
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
            })
      ],
    );
  }

  void onTap(a) {
    popupController.hidePopup();
    if (focusNode.hasFocus) focusNode.unfocus();
  }

  void onPositionChanged(position, value) {
    controller.setBounds(position.bounds);
    if (position.zoom >= 8.0) {
      controller.setMarkerShowed(MarkersType.cities);
    } else {
      controller.setMarkerShowed(MarkersType.states);
    }
  }
}
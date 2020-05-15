import 'package:corona_data/app/modules/charts/charts_module.dart';
import 'package:corona_data/app/modules/charts/widgets/city_chart/city_chart_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/country_cases/country_cases_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/state_chart/state_chart_widget.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/states_map/utils/constants.dart';
import 'package:corona_data/app/modules/states_map/widgets/map_tooltip_widget.dart';
import 'package:corona_data/app/shared/models/city_model.dart';
import 'package:corona_data/app/shared/models/country_model.dart';
import 'package:corona_data/app/shared/models/country_model_marker.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/utils/modal_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CoronaMap extends StatefulWidget {
  const CoronaMap({
    Key key,
    @required this.mapController,
    @required this.globalSettingsController,
    @required this.controller,
    @required this.popupController,
    this.focusNode,
  }) : super(key: key);

  final MapController mapController;
  final GlobalSettingsController globalSettingsController;
  final StatesMapController controller;
  final PopupController popupController;

  final FocusNode focusNode;

  @override
  _CoronaMapState createState() => _CoronaMapState();
}

class _CoronaMapState extends State<CoronaMap> {
  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => FlutterMap(
              mapController: widget.mapController,
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
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                    tileProvider: CachedNetworkTileProvider(),
                    backgroundColor: widget
                        .globalSettingsController.theme.themeData.primaryColor),
                MarkerClusterLayerOptions(
                    animationsOptions: AnimationsOptions(
                        fitBound: Duration(seconds: 1),
                        spiderfy: Duration(seconds: 1)),
                    showPolygon: false,
                    maxClusterRadius: widget.controller.maxClusterRadius,
                    size: Size(30, 30),
                    anchor: AnchorPos.align(AnchorAlign.center),
                    fitBoundsOptions: FitBoundsOptions(
                      padding: EdgeInsets.all(
                          widget.controller.markerShowed == MarkersType.cities
                              ? 40
                              : 100),
                    ),
                    markers: widget.controller.markersShowed.keys.toList(),
                    polygonOptions: PolygonOptions(
                        borderColor: Colors.blueAccent,
                        color: Colors.black12,
                        borderStrokeWidth: 3),
                    popupOptions: PopupOptions(
                      popupSnap: PopupSnap.top,
                      popupController: widget.popupController,
                      popupBuilder: (_, marker) {
                        IMarkerModelData stateModel =
                            widget.controller.markersShowed[marker];
                        return MapTooltipWidget(
                          stateModel: stateModel,
                          onTap: () => ModalUtils.showModal(
                            context,
                            mapWidget(stateModel)
                          ),
                        );
                      },
                    ),
                    builder: (context, markers) {
                      return FloatingActionButton(
                        heroTag: UniqueKey(),
                        backgroundColor: widget.globalSettingsController.theme
                            .themeData.primaryColor,
                        child: Text(
                          markers.length.toString(),
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        onPressed: null,
                      );
                    })
              ],
            ));
  }

  Widget mapWidget(IMarkerModelData markerModel) {
    switch (markerModel.runtimeType) {
      case StateModel:
        return ChartsModule(StateChartWidget(
          stateName: markerModel.key,
        ));
      case CityModel:
        return ChartsModule(CityChartWidget(
          cityName: markerModel.title,
          cityCode: markerModel.key,
        ));
      case CountryModelMarker:
        return ChartsModule(CountryCasesGraphWidget(
          countryName: markerModel.title,
        ));
    }

    throw Exception('MarkerModel has an invalid type');
  }

  void onTap(a) {
    widget.popupController.hidePopup();
    if (widget.focusNode.hasFocus) widget.focusNode.unfocus();
  }

  void onPositionChanged(position, value) {
    

    widget.controller.setBounds(position.bounds);
    if (widget.focusNode.hasFocus) widget.focusNode.unfocus();
    if (position.zoom >= 8.0) {
      widget.controller.setMarkerShowed(MarkersType.cities);
    } else {
      widget.controller.setMarkerShowed(MarkersType.states);
    }
  }
}

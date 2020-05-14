import 'package:corona_data/app/modules/charts/charts_module.dart';
import 'package:corona_data/app/modules/charts/widgets/city_chart/city_chart_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/state_chart/state_chart_widget.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/cities_auto_complete_field.dart';
import 'package:corona_data/app/modules/states_map/widgets/map_tooltip_widget.dart';
import 'package:corona_data/app/shared/models/city_model.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/utils/modal_utils.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  final FocusNode _focusNode = FocusNode();
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
        return TryAgainWidget(onPressed: controller.fetchData());
      }

      // List<IMarkerModelData> states = controller.markersData;

      if (controller.markers == null) {
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

      return Scaffold(
        resizeToAvoidBottomInset:false,
        resizeToAvoidBottomPadding:false,
        floatingActionButton: MapFloatingActionButton(
          controller: controller,
          globalSettingsController: globalSettingsController,
        ),
        body: Stack(
          
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                interactive: true,
                
                onPositionChanged: (position, value) {
                  controller.setBounds(position.bounds);
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
                  if(_focusNode.hasFocus) _focusNode.unfocus();
                  

                },
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
                    backgroundColor:
                        globalSettingsController.theme.themeData.primaryColor),
                MarkerClusterLayerOptions(
                    animationsOptions: AnimationsOptions(
                        fitBound: Duration(seconds: 1),
                        spiderfy: Duration(seconds: 1)),
                    showPolygon: false,
                    maxClusterRadius: controller.maxClusterRadius,
                    size: Size(30, 30),
                    anchor: AnchorPos.align(AnchorAlign.center),
                    fitBoundsOptions: FitBoundsOptions(
                      padding: EdgeInsets.all(
                          controller.markerShowed == MarkersType.cities
                              ? 40
                              : 100),
                    ),
                    markers: controller.markersShowed.keys.toList(),
                    polygonOptions: PolygonOptions(
                        borderColor: Colors.blueAccent,
                        color: Colors.black12,
                        borderStrokeWidth: 3),
                    popupOptions: PopupOptions(
                      popupSnap: PopupSnap.top,
                      popupController: _popupController,
                      popupBuilder: (_, marker) {
                        IMarkerModelData stateModel =
                            controller.markersShowed[marker];
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
                        backgroundColor: globalSettingsController
                            .theme.themeData.primaryColor,
                        child: Text(
                          markers.length.toString(),
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        onPressed: null,
                      );
                    })
              ],
            ),
            CitiesAutoCompleteField(
              statesMapController: controller,
              globalSettingsController: globalSettingsController,
              focusNode: _focusNode,
              onSelected: (IMarkerModelData markerModel){
                _focusNode.unfocus();

                if(markerModel is CityModel){
                  mapController.move(markerModel.latLng, 12.5);
                  
                }else{
                  mapController.move(markerModel.latLng, 7.0);
                }
                
              },
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}

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

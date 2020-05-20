import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/autocomplete/cities_auto_complete_field.dart';
import 'package:corona_data/app/modules/states_map/widgets/corona_map.dart';
import 'package:corona_data/app/modules/states_map/widgets/map_floating_action_button.dart';
import 'package:corona_data/app/shared/models/city_model.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          controller.citiesData.error != null ||
          controller.countriesData.error != null) {
        return TryAgainWidget(onPressed: controller.fetchData());
      }

      if (controller.markersShowed == null || controller.markers.isEmpty) {
        return Center(
          child: Container(
            width: 150,
            height: 150,
            child: VirusCircularAnimation(
              animation: VirusAnimation.rotation_fast,
              fit: BoxFit.contain,
              size: AnimationSizes.large,
            ),
          ),
        );
      }
      return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        floatingActionButton: MapFloatingActionButton(
          
          globalSettingsController: globalSettingsController,
          mapController:mapController
        ),
        body: Stack(
          children: [
            CoronaMap(
                mapController: mapController,
                globalSettingsController: globalSettingsController,
                popupController: _popupController,
                focusNode: _focusNode,
                ),
            CitiesAutoCompleteField(
              globalSettingsController: globalSettingsController,
              focusNode: _focusNode,
              onSelected: (IMarkerModelData markerModel) {
                if(_focusNode.hasFocus) _focusNode.unfocus();
                

                if (markerModel is CityModel) {
                  mapController.move(markerModel.latLng, 12.5);
                } else {
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
    _focusNode.dispose();
    
    disposer();
    
    super.dispose();
  }
}

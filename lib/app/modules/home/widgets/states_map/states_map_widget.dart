import 'package:corona_data/app/modules/home/widgets/states_map/states_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class StatesMapWidget extends StatefulWidget {
  final String title;
  const StatesMapWidget({Key key, this.title = "StatesMap"}) : super(key: key);

  @override
  _StatesMapWidgetState createState() => _StatesMapWidgetState();
}

class _StatesMapWidgetState extends ModularState<StatesMapWidget, StatesMapController> {
  BitmapDescriptor customIcon;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-13.516151006814436, -54.849889911711216),
    zoom: 3.4989821910858154,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (controller.markers.error != null) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Não foi possível acessar os dados.',
                style: TextStyle(
                    color: Theme.of(context).primaryColorLight, fontSize: 16),
              ),
              Container(
                height: 10,
              ),
              FlatButton(
                  onPressed: controller.fetchMarkers,
                  color: Theme.of(context).accentColor,
                  child: Text('Tentar novamente')),
            ],
          ),
        );
      }

      Set<Marker> markers = controller.markers.value;

      if (markers == null) {
        return Center(child: CircularProgressIndicator());
      }

      return GoogleMap(
        markers: markers,
        onTap: (value) {},
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      );
    });
  }
}

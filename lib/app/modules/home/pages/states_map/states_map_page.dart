import 'package:corona_data/app/modules/home/pages/states_map/states_map_controller.dart';
import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class StatesMapPage extends StatefulWidget {
  final String title;
  const StatesMapPage({Key key, this.title = "StatesMap"}) : super(key: key);

  @override
  _StatesMapPageState createState() => _StatesMapPageState();
}

class _StatesMapPageState extends State<StatesMapPage> {
  BitmapDescriptor customIcon;

  StatesMapController statesController = Modular.get<StatesMapController>();
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
      print(statesController.statesInfo.error);
      if (statesController.statesInfo.error != null) {
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
                  onPressed: statesController.fetchStatesInfo,
                  color: Theme.of(context).accentColor,
                  child: Text('Tentar novamente')),
            ],
          ),
        );
      }

      List<StateModel> states = statesController.statesInfo.value;

      if (states == null) {
        return Center(child: CircularProgressIndicator());
      }

      if (customIcon == null) {
        ImageConfiguration configuration =
            createLocalImageConfiguration(context, size: Size.square(5));
        BitmapDescriptor.fromAssetImage(
          
            configuration, 'assets/ball_marker.png').then((icon){
              customIcon = icon;
              setState(() {
                
              });
            });
      }

      Set<Marker> markers = Set();

      for (var state in states) {
        markers.add(Marker(
            markerId: MarkerId(state.state),
            position: stateCoords[state.state],
            icon: customIcon,
            infoWindow: InfoWindow(
                title: state.state,
                snippet: "${state.confirmed} casos, ${state.deaths} mortes")));
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

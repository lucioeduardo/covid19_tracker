import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui';

Future<BitmapDescriptor> getMarkerIcon(
  Color color,
  int width,
) async {
  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint = Paint()..color = color;
  final double radius = width / 2;

  canvas.drawCircle(
    Offset(radius, radius),
    radius,
    paint,
  );

  final image = await pictureRecorder.endRecording().toImage(
        radius.toInt() * 2,
        radius.toInt() * 2,
      );

  final data = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
}

Marker getStateMarker(StateModel state, BitmapDescriptor icon) {
  return Marker(
      markerId: MarkerId(state.state),
      position: stateCoords[state.state],
      icon: icon,
      infoWindow: InfoWindow(
          title: state.state,
          snippet: "${state.confirmed} casos, ${state.deaths} mortes"));
}



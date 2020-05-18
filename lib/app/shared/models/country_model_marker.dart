import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/widgets/maps/markers/background/svg_background.dart';
import 'package:corona_data/app/shared/widgets/maps/markers/circle_marker.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import '../utils/localization/i18n/base_translation_with_countries_extension.i18n.dart';

const kLabel = "Country";
const kColor = "warning";
const double kCountriesBaseSize = 50.0;

class CountryModelMarker implements IMarkerModelData {
  int confirmed;
  int deaths;
  LatLng latLng;
  String shortTitle;
  CountryModelMarker(
      {this.confirmed, this.deaths, this.latLng, this.shortTitle});

  CountryModelMarker.fromJson(Map<String, dynamic> json) {
    shortTitle = json['countryInfo']['iso2'];

    var lat = json['countryInfo']['lat'];
    var long = json['countryInfo']['long'];
    latLng = LatLng(lat.toDouble(), long.toDouble());

    confirmed = json['cases'];
    deaths = json['deaths'];
  }

  @override
  get label => kLabel;

  @override
  String get key => null;

  @override
  String get title => shortTitle.i18n;

  @override
  String get colorName => kColor;

  @override
  Widget getMarker(Color color) {
    return Container(
      child: GestureDetector(
        child: CircleMarker(
          shortTitle: shortTitle,
          color: color,
          size: kCountriesBaseSize,
          child: SvgBackgroundMarker(
            height: 40.0,
            imagePath: "assets/flags/${this.shortTitle.toLowerCase()}.svg",
          ),
        ),
      ),
    );
  }
}

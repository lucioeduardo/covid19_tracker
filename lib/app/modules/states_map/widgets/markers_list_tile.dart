import 'package:corona_data/app/modules/states_map/widgets/cities_auto_complete_field.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../i18n/states_map.i18n.dart';

class MarkersListTile extends StatelessWidget {
  const MarkersListTile({
    Key key,
    @required this.widget,
    this.markerModel,
  }) : super(key: key);

  final CitiesAutoCompleteField widget;
  final IMarkerModelData markerModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(
        FontAwesomeIcons.mapMarker,
        color: widget.globalSettingsController.theme.extraPallete[markerModel.colorName]
      ),
      title: Text(
        markerModel.title,
        style: TextStyle(
            color: Theme.of(context).accentColor, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        markerModel.label.i18n,
        style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w800, fontSize: 13),
      ),
    );
  }
}
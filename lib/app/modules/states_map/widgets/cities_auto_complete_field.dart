import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CitiesAutoCompleteField extends StatefulWidget {
  final StatesMapController statesMapController;
  final void Function(IMarkerModelData markerModel) onSelected;

  const CitiesAutoCompleteField({Key key, this.statesMapController, this.onSelected})
      : super(key: key);
  @override
  _CitiesAutoCompleteFieldState createState() =>
      _CitiesAutoCompleteFieldState();
}

class _CitiesAutoCompleteFieldState extends State<CitiesAutoCompleteField> {
  _CitiesAutoCompleteFieldState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20, left: 40, right: 40),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          autofocus: false,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              backgroundColor: Theme.of(context).accentColor,
              decorationColor: Theme.of(context).accentColor,
              color: Theme.of(context).primaryColor),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Digite para buscar.",
              labelStyle: TextStyle(backgroundColor: Colors.transparent)),
        ),
        suggestionsCallback: (pattern) async {
          
          return await widget.statesMapController.findMarker(pattern);
        },
        debounceDuration: Duration(milliseconds: 300),
        itemBuilder: (context, IMarkerModelData markerModel) {
          return ListTile(
            leading: FaIcon(
              FontAwesomeIcons.mapMarker,
              color: Theme.of(context).primaryColorLight,
            ),
            title: Text(
              markerModel.title,
              style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              markerModel.shortTitle,
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w800,fontSize: 13),
            ),
          );
        },
        onSuggestionSelected: (IMarkerModelData markerModel) {
          widget.onSelected(markerModel);
        },
      ),
    );
  }
}

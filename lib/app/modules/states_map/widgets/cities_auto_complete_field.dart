import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/markers_list_tile.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../translations/states_map.i18n.dart';

class CitiesAutoCompleteField extends StatefulWidget {
  final StatesMapController statesMapController;
  final GlobalSettingsController globalSettingsController;

  final FocusNode focusNode;
  final void Function(IMarkerModelData markerModel) onSelected;

  const CitiesAutoCompleteField(
      {Key key,
      this.statesMapController,
      this.onSelected,
      this.focusNode,
      this.globalSettingsController})
      : super(key: key);
  @override
  _CitiesAutoCompleteFieldState createState() =>
      _CitiesAutoCompleteFieldState();
}

class _CitiesAutoCompleteFieldState extends State<CitiesAutoCompleteField> {
  final TextEditingController _typeAheadController = TextEditingController();
  _CitiesAutoCompleteFieldState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20, left: 40, right: 40),
      child: TypeAheadField(
        hideSuggestionsOnKeyboardHide: true,
        debounceDuration: Duration(milliseconds: 500),
        animationDuration: Duration(milliseconds: 800),
        textFieldConfiguration: TextFieldConfiguration(
          controller: _typeAheadController,
          autofocus: false,
          focusNode: widget.focusNode,
          style: TextStyle(
              fontStyle: FontStyle.normal,
              backgroundColor: Theme.of(context).accentColor,
              decorationColor: Theme.of(context).accentColor,
              color: Theme.of(context).primaryColor),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  iconSize: 16,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    _typeAheadController.clear();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.times,
                    color: Theme.of(context).primaryColorDark,
                  )),
              border: OutlineInputBorder(),
              labelText: "Tap for search.".i18n,
              labelStyle: TextStyle(backgroundColor: Colors.transparent)),
        ),
        suggestionsCallback: (pattern) async {
          return await widget.statesMapController.findMarkers(pattern);
        },
        itemBuilder: (context, IMarkerModelData markerModel) {
          return MarkersListTile(
            widget: widget,
            markerModel: markerModel,
          );
        },
        onSuggestionSelected: (IMarkerModelData markerModel) {
          _typeAheadController.clear();
          widget.onSelected(markerModel);
        },
        loadingBuilder: (context) {
          return Text("Loading..".i18n);
        },
        noItemsFoundBuilder: (_) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              _typeAheadController.text.isNotEmpty
                  ? "No itens found.".i18n
                  : "Type for search.".i18n,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          );
        },
        errorBuilder: (_, __) {
          return Text("blank".i18n);
        },
      ),
    );
  }
}

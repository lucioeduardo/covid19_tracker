import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/markers_list_tile.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/utils/theme/extra_pallete.dart';
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
  ExtraPallete extraPallete;

  @override
  Widget build(BuildContext context) {
    extraPallete = widget.globalSettingsController.theme.extraPallete;
    return Container(
      margin: EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: extraPallete.light.withOpacity(0.7),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: extraPallete.dark.withOpacity(0.1),
              offset: Offset.fromDirection(1,4),
              spreadRadius: 2
            )
          ]),
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
            color: extraPallete.dark,
          ),
          decoration: inputDecoration(),
        ),
        suggestionsCallback: (pattern) async {
          return await widget.statesMapController.findMarkers(pattern);
        },
        itemBuilder: itemBuilder,
        onSuggestionSelected: onSuggestionSelected,
        noItemsFoundBuilder: noItemsFoundBuilder,
        loadingBuilder: (context) {
          return Text("Loading..".i18n);
        },
        errorBuilder: (_, __) {
          return Text("blank".i18n);
        },
      ),
    );
  }

  void onSuggestionSelected(IMarkerModelData markerModel) {
    _typeAheadController.clear();
    widget.onSelected(markerModel);
  }

  Widget itemBuilder(context, IMarkerModelData markerModel) {
    return MarkersListTile(
      widget: widget,
      markerModel: markerModel,
    );
  }

  Widget noItemsFoundBuilder(context) {
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
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
        // prefixStyle: TextStyle(fontSize: 16),
        prefix: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: FaIcon(
            FontAwesomeIcons.search,
            size: 16,
            color: extraPallete.dark,
          ),
        ),
        suffixIcon: IconButton(
            iconSize: 16,
            padding: EdgeInsets.all(0),
            onPressed: () {
              _typeAheadController.clear();
            },
            icon: FaIcon(
              FontAwesomeIcons.times,
              color: extraPallete.dark,
            )),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
          gapPadding: 0.0,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 2.0)),
        labelText: "Tap for search.".i18n,
        labelStyle: TextStyle(
          backgroundColor: Colors.transparent,
          fontWeight: FontWeight.w900,
          color: extraPallete.dark,
        ));
  }
}

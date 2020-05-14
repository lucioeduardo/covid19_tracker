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
    extraPallete=widget.globalSettingsController.theme.extraPallete;
    return Container(
      
      margin: EdgeInsets.only(top: 20, left: 40, right: 40),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: extraPallete.light,),
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
              // backgroundColor: extraPallete.dark,
              // decorationColor: extraPallete.dark,
              
              color: extraPallete.dark),
          decoration: InputDecoration(
              prefixStyle: TextStyle(fontSize: 16),
              prefix: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FaIcon(
                      
                      FontAwesomeIcons.search,
                      size:16,
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
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)),gapPadding: 0.0),
              labelText: "Tap for search.".i18n,
              labelStyle: TextStyle(backgroundColor: Colors.transparent,fontWeight: FontWeight.w800, color: extraPallete.dark,)),
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

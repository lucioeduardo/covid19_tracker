import 'dart:async';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/autocomplete/auto_complete_field_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/map/markers_list_tile.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/utils/theme/extra_pallete.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/forms/autocomplete_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CitiesAutoCompleteField extends StatefulWidget {
  final GlobalSettingsController globalSettingsController;

  final FocusNode focusNode;
  final void Function(IMarkerModelData markerModel) onSelected;

  const CitiesAutoCompleteField({
    Key key,
    this.onSelected,
    this.focusNode,
    this.globalSettingsController,
  }) : super(key: key);
  @override
  _CitiesAutoCompleteFieldState createState() =>
      _CitiesAutoCompleteFieldState();
}

class _CitiesAutoCompleteFieldState
    extends ModularState<CitiesAutoCompleteField, AutoCompleteFieldController>
    with SingleTickerProviderStateMixin {
  final TextEditingController _typeAheadController = TextEditingController();
  _CitiesAutoCompleteFieldState();
  ExtraPallete extraPallete;
  final double kBorderRadius = 5.0;
  final SuggestionsBoxController suggestionsBoxController =
      SuggestionsBoxController();

  AnimationController _animationController;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animation = CurvedAnimation(
        curve: Curves.easeInCubic,
        parent:
            Tween<double>(begin: 0.0, end: 1.0).animate(_animationController));
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.isShowAutocomplete) {
        _animationController.forward();
        
        return FadeTransition(
          opacity: _animation,
          child: AutocompleteHeader(
            suggestionsBoxController: suggestionsBoxController,
            typeAheadController: _typeAheadController,
            primaryColor:
                widget.globalSettingsController.theme.extraPallete.light,
            accentColor:
                widget.globalSettingsController.theme.extraPallete.dark,
            kBorderRadius: kBorderRadius,
            focusNode: widget.focusNode,
            onSuggestionSelected: onSuggestionSelected,
            itemBuilder: itemBuilder,
            suggestionsCallback: suggestionsCallback,
          ),
        );
      } else {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          VirusCircularAnimation(
            animation: VirusAnimation.rotation_fast,
            size: 80,
            fit: BoxFit.cover,
          )
        ]);
      }
    });
  }

  Future<List<IMarkerModelData>> suggestionsCallback(pattern) async {
    return await controller.findMarkers(pattern);
  }

  void onSuggestionSelected(IMarkerModelData markerModel) {
    _typeAheadController.clear();
    controller.addToLatestSearchs(markerModel.key);
    widget.onSelected(markerModel);
  }

  Widget itemBuilder(context, IMarkerModelData markerModel) {
    return MarkersListTile(
      widget: widget,
      markerModel: markerModel,
    );
  }

  @override
  void dispose() {
    
    _animationController.dispose();
    super.dispose();
    
    // print("autocomplete disposado");
  }
}

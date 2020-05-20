import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:corona_data/app/shared/extensions/list/where_limit_list_extension.dart';
import 'package:corona_data/app/shared/extensions/string/diacritcs_string_extension.dart';
part 'auto_complete_field_controller.g.dart';

class AutoCompleteFieldController = _AutoCompleteFieldControllerBase
    with _$AutoCompleteFieldController;

abstract class _AutoCompleteFieldControllerBase with Store {
  
  final StatesMapController mapsController;

  List<IMarkerModelData> _allMarkersData = [];

  _AutoCompleteFieldControllerBase(this.mapsController);


  List<IMarkerModelData> get allMarkers {
    
    if (_allMarkersData != null && _allMarkersData.isNotEmpty)
      return _allMarkersData;
    _allMarkersData.addAll(mapsController.citiesData.value);
    _allMarkersData.addAll(mapsController.statesData.value);
    _allMarkersData.addAll(mapsController.countriesData.value);
    return _allMarkersData;
  }

  Future<List<IMarkerModelData>> findMarkers(String query) async {
    
    query = query.toLowerCase().normalizeDiacritics();

    if (query.isEmpty || query == null) {
      return [];
    }

    return this.allMarkers.whereLimit((marker) {
      return marker.title.toLowerCase().normalizeDiacritics().contains(
            query,
          );
    }, limit: 15);
  }
}

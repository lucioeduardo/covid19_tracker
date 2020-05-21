import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:corona_data/app/shared/extensions/list/where_limit_list_extension.dart';
import 'package:corona_data/app/shared/extensions/string/diacritcs_string_extension.dart';
part 'auto_complete_field_controller.g.dart';

class AutoCompleteFieldController = _AutoCompleteFieldControllerBase
    with _$AutoCompleteFieldController;

abstract class _AutoCompleteFieldControllerBase with Store {
  _AutoCompleteFieldControllerBase(this.mapsController, this.localStorage) {
    loadLatestSearchs();
  }

  final StatesMapController mapsController;
  final ILocalStorage localStorage;

  List<IMarkerModelData> _allMarkersData = [];

  @observable
  ObservableFuture<List<String>> latestSearchs;

  @action
  void loadLatestSearchs() {
    latestSearchs = localStorage.getLatestSearchs().asObservable();
  }

  @action
  void addToLatestSearchs(String search) {
    if (latestSearchs.value == null || search.isEmpty || search == null) {
    } else {
      List<String> tempLatestSearchs = latestSearchs.value;
      int index = tempLatestSearchs.indexOf(search);
      if (index != -1) tempLatestSearchs.removeAt(index);

      tempLatestSearchs.insert(0, search);
      tempLatestSearchs = normalizeListLenght(tempLatestSearchs, 6);
      localStorage.setLatestSearchs(tempLatestSearchs);
      latestSearchs = ObservableFuture.value(tempLatestSearchs);
    }
  }

  List<String> normalizeListLenght(List<String> list, int lenght) {
    return list.length >= lenght ? list.getRange(0, lenght).toList() : list;
  }

  List<IMarkerModelData> get allMarkers {
    if (_allMarkersData != null && _allMarkersData.isNotEmpty)
      return _allMarkersData;
    _allMarkersData.addAll(mapsController.citiesData.value);
    _allMarkersData.addAll(mapsController.statesData.value);
    _allMarkersData.addAll(mapsController.countriesData.value);
    return _allMarkersData;
  }

  Future<List<IMarkerModelData>> findMarkers(String query) async {
    if (query == null) {
      return [];
    } else if (query.isEmpty) {
      return _findLatestMarkers(latestSearchs.value);
    }
    query = query.toLowerCase().normalizeDiacritics();

    return _findOnMarkers(query);
  }

  Future<List<IMarkerModelData>> _findLatestMarkers(
      List<String> latestSearchs) async {
    if (latestSearchs == null || latestSearchs.isEmpty) return [];

    List<IMarkerModelData> tempList = [];
    latestSearchs.forEach((e) {
      IMarkerModelData tempElement = allMarkers.firstWhere((element) {
        return element.key == e;
      }, orElse: () {});
      if (tempElement != null) {
        tempList.add(tempElement);
        
      }
    });

    return (tempList);
  }

  Future<List<IMarkerModelData>> _findOnMarkers(String query) async {
    return this.allMarkers.whereLimit((marker) {
      return marker.title.toLowerCase().normalizeDiacritics().contains(
            query,
          );
    }, limit: 15);
  }

  // @override
  // void dispose() {
  //   // _allMarkersData = [];
  //   // print("Autocomplete controller disposado");
    
  // }

}

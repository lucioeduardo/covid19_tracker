import 'dart:async';

import 'package:corona_data/app/modules/states_map/states_map_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/autocomplete/auto_complete_field_controller.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';

import '../../../../helpers/statesmap_module_init_helper.dart';

void main() {
  InitStatesMapModuleHelper().load();
  AutoCompleteFieldController autoCompleteFieldController;

  setUp(() {
    autoCompleteFieldController = Modular.get();
  });

  group('AutoCompleteFieldController Test', () {
    group("Basic", () {
      setUp(() {
        autoCompleteFieldController.loadLatestSearchs();
      });
      test("Test constructor params and Variables", () async {
        expect(autoCompleteFieldController.mapsController,
            isInstanceOf<StatesMapController>());
        expect(autoCompleteFieldController.localStorage,
            isInstanceOf<ILocalStorage>());
        expect(autoCompleteFieldController.latestSearchs,
            isInstanceOf<ObservableFuture<List<String>>>());
        expect(autoCompleteFieldController.forceShowAutocomplete, false);

        expect(autoCompleteFieldController.allMarkersSearchableData,
            isInstanceOf<List<IMarkerModelData>>());
        expect(
          autoCompleteFieldController.showAutocompleteTime,
          1500,
        );
        expect(
          autoCompleteFieldController.whenCitiesData,
          isNotNull,
        );
        expect(
          autoCompleteFieldController.whenStatesData,
          isNotNull,
        );
        expect(
          autoCompleteFieldController.whenCountryData,
          isNotNull,
        );
      });
      test("Test loadLatestSearchs", () async {
        expect(
          autoCompleteFieldController.latestSearchs.value,
          containsAll(['AL', 'PE']),
        );
      });
      test("Test showAutoComplete and LoadAutocomplete", () async {
        autoCompleteFieldController
            .defineShowAutocompleteTimer(Duration(microseconds: 0));
        expect(
          autoCompleteFieldController.isShowAutocomplete,
          true,
        );
        autoCompleteFieldController.allMarkersSearchableData = [];
        autoCompleteFieldController.reactionsLoadAllMarkersSearchableData();
        expect(
          autoCompleteFieldController.allMarkersSearchableData.length,
          5,
        );

        autoCompleteFieldController.setForceShowAutocomplete(false);

        expect(autoCompleteFieldController.forceShowAutocomplete, false);

        expect(
          autoCompleteFieldController.forceShowAutocomplete,
          false,
        );
      });
      test("Test isShowAutoComplete", () async {
        
        expect(autoCompleteFieldController.isShowAutocomplete, true);

        autoCompleteFieldController.mapsController.citiesData = ObservableFuture.value(null);
        autoCompleteFieldController.setForceShowAutocomplete(false);
        expect(autoCompleteFieldController.isShowAutocomplete, false);

        autoCompleteFieldController.setForceShowAutocomplete(true);
        expect(autoCompleteFieldController.isShowAutocomplete, true);
      });
      test("Test addToLatestSearchs", () async {
        autoCompleteFieldController.addToLatestSearchs("PE");
        expect(
          autoCompleteFieldController.latestSearchs.value,
          containsAllInOrder(['PE', 'AL']),
        );
        autoCompleteFieldController.addToLatestSearchs("AL");
        expect(
          autoCompleteFieldController.latestSearchs.value,
          containsAllInOrder(['AL', 'PE']),
        );
        autoCompleteFieldController.addToLatestSearchs("");
        expect(
          autoCompleteFieldController.latestSearchs.value,
          containsAllInOrder(['AL', 'PE']),
        );
        autoCompleteFieldController.addToLatestSearchs(null);
        expect(
          autoCompleteFieldController.latestSearchs.value,
          containsAllInOrder(['AL', 'PE']),
        );
        autoCompleteFieldController.addToLatestSearchs("a");
        autoCompleteFieldController.addToLatestSearchs("b");
        autoCompleteFieldController.addToLatestSearchs("c");
        autoCompleteFieldController.addToLatestSearchs("d");
        autoCompleteFieldController.addToLatestSearchs("e");
        expect(
          autoCompleteFieldController.latestSearchs.value,
          containsAllInOrder(['e', 'd', "c", 'b', 'a', 'AL']),
        );
        expect(
          autoCompleteFieldController.latestSearchs.value.indexOf("PE"),
          -1
        );
        expect(
            autoCompleteFieldController.latestSearchs.value.length, equals(6));
      });

      test("Test findOnMarkers", () async {
        expect(
            (await autoCompleteFieldController.findOnMarkers("alagoas")).length,
            equals(1));
        expect(
            (await autoCompleteFieldController.findOnMarkers("álagõas")).length,
            equals(1));
        expect(
            (await autoCompleteFieldController.findOnMarkers("Álagôas")).length,
            equals(1));
        expect((await autoCompleteFieldController.findOnMarkers("a")).length,
            equals(5));
        expect((await autoCompleteFieldController.findOnMarkers("-12")).length,
            equals(0));
      });

      test("Test findLatestMarkers", () async {
        expect((await autoCompleteFieldController.findLatestMarkers(null)),
            equals([]));
        expect((await autoCompleteFieldController.findLatestMarkers([])),
            equals([]));
        expect(
            (await autoCompleteFieldController.findLatestMarkers(['AL']))
                .length,
            equals(1));
        expect(
            (await autoCompleteFieldController.findLatestMarkers(['AL', 'PE']))
                .length,
            equals(2));
      });
      test("Test findMarkers", () async {
        expect(
            (await autoCompleteFieldController.findMarkers(null)), equals([]));
        expect((await autoCompleteFieldController.findMarkers('')).length,
            equals(2));
        expect((await autoCompleteFieldController.findMarkers('a')).length,
            equals(5));
        expect(
            (await autoCompleteFieldController.findMarkers('ÁlaGôãs')).length,
            equals(1));
      });
      test("Test Get allMarkers", () async {
        // autoCompleteFieldController.allMarkers;
        expect(autoCompleteFieldController.allMarkersSearchableData.length,
            equals(5));

        expect(autoCompleteFieldController.latestSearchs,
            isInstanceOf<ObservableFuture<List<String>>>());
      });
    });
  });
  // s.stop();
}

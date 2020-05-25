import 'package:corona_data/app/app_module.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/states_map_module.dart';
import 'package:corona_data/app/modules/states_map/widgets/autocomplete/auto_complete_field_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/autocomplete/cities_auto_complete_field.dart';
import 'package:corona_data/app/modules/states_map/widgets/markers_list_tile.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/services/local_storage_interface.dart';
import 'package:corona_data/app/shared/widgets/forms/autocomplete_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../mocks/covid_repository_mock.dart';
import '../../../mocks/local_storage_mock.dart';

main() {
  CovidRepositoryMock covidRepositoryMock = CovidRepositoryMock();
  LocalStorageMock localStorageMock = LocalStorageMock();

  initModule(AppModule(), changeBinds: [
    Bind<ILocalStorage>((i) => localStorageMock),
  ]);
  initModule(HomeModule(), changeBinds: [
    Bind<ICovidRepository>((i) => covidRepositoryMock),
  ]);
  initModule(StatesMapModule());

  AutoCompleteFieldController autoCompleteFieldController;
  GlobalSettingsController globalSettings;
  setUp(() {
    autoCompleteFieldController = Modular.get();
    globalSettings = Modular.get();
  });

  group("Test Cities Autocomplete field", () {
    
    testWidgets("Test CitiesAutoCompleteField Empty",
        (WidgetTester tester) async {
      await pumpAutoCompleteWidget(tester, globalSettings);
      
      final titleTapForSearch = find.text("Tap for search.");
      expect(titleTapForSearch, findsOneWidget);
      
      final typeTextField = find.byType(TextField);
      expect(typeTextField, findsOneWidget);

      await tester.enterText(typeTextField, "-1");

      await tester.pumpAndSettle(Duration(milliseconds: 300));
      final markersListTile = find.byType(MarkersListTile);
      expect(markersListTile, findsNothing);
      
    });
  });
    testWidgets("Test CitiesAutoCompleteField searchs",
        (WidgetTester tester) async {
      await pumpAutoCompleteWidget(tester, globalSettings);
      
      
      final typeTextField = find.byType(CitiesAutoCompleteField);
      expect(typeTextField, findsOneWidget);

      await tester.tap(typeTextField);

      await tester.pumpAndSettle(Duration(milliseconds: 300));
      final titleTapForSearch = find.text("Tap for search.");
      
      expect(titleTapForSearch, findsOneWidget);
      final markersListTile = find.byType(MarkersListTile);
      expect(markersListTile, findsNWidgets(2));
      print(markersListTile);
    });
  
}

Future<void> pumpAutoCompleteWidget(WidgetTester tester, GlobalSettingsController globalSettings) {
  return tester.pumpWidget(MaterialApp(
      title: "teste",
      home: Scaffold(
        body: CitiesAutoCompleteField(
          onSelected: (IMarkerModelData markerModel) {},
          focusNode: FocusNode(),
          globalSettingsController: globalSettings,
        ),
      ),
    ));
}

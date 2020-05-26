import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/autocomplete/auto_complete_field_controller.dart';
import 'package:corona_data/app/modules/states_map/widgets/autocomplete/cities_auto_complete_field.dart';
import 'package:corona_data/app/modules/states_map/widgets/map/markers_list_tile.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/forms/autocomplete_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/statesmap_module_init_helper.dart';

main() {
  InitStatesMapModuleHelper().load();

  GlobalSettingsController globalSettings;
  
  
  setUp(() {
    globalSettings = Modular.get();
    
    
  });

  group("Test Cities Autocomplete field", () {
    // setUp((){
    //   AutoCompleteFieldController autocompleteFieldController = Modular.get();
    //   autocompleteFieldController.mapsController.fetchData();
    //   autocompleteFieldController.reactionsLoadAllMarkersSearchableData();
    // });
    testWidgets("Test CitiesAutoCompleteField Empty",
        (WidgetTester tester) async {
      await pumpAutoCompleteWidget(tester, globalSettings);
      await tester.pumpAndSettle(Duration(milliseconds: 400));
      final titleTapForSearch = find.text("Tap for search.");
      expect(titleTapForSearch, findsOneWidget);

      final typeTextField = find.byType(TextField);
      expect(typeTextField, findsOneWidget);

      await tester.enterText(typeTextField, "-1");

      await tester.pumpAndSettle(Duration(milliseconds: 400));
      final markersListTile = find.byType(MarkersListTile);
      expect(markersListTile, findsNothing);
    });
  });
  // testWidgets("Test CitiesAutoCompleteField VirusAnimation",
  //     (WidgetTester tester) async {
    

  //   AutoCompleteFieldController autocompleteFieldController = Modular.get();
  //   autocompleteFieldController.mapsController.citiesData=ObservableFuture.value(null);
  //   await pumpAutoCompleteWidget(tester, globalSettings);

  //   Finder virusAnimationWidget = find.byType(VirusCircularAnimation);
  //   expect(virusAnimationWidget, findsOneWidget);

  //   autocompleteFieldController.setForceShowAutocomplete(true);
  //   await tester.pumpAndSettle();
  //   visibleAndHideWidget(CitiesAutoCompleteField, VirusCircularAnimation);
  //   // expect(virusAnimationWidget, findsNothing);

  //   autocompleteFieldController.setForceShowAutocomplete(false);
  //   autocompleteFieldController.mapsController.citiesData=ObservableFuture.value([]);
  //   await tester.pumpAndSettle();
  //   visibleAndHideWidget(CitiesAutoCompleteField, VirusCircularAnimation);
    
  // });

  

  testWidgets("Test CitiesAutoCompleteField searchs",
      (WidgetTester tester) async {
    await pumpAutoCompleteWidget(tester, globalSettings);
    await tester.pumpAndSettle(Duration(milliseconds: 400));
    final typeTextField = find.byType(TextField);
    expect(typeTextField, findsOneWidget);

    await tester.tap(typeTextField);

    await tester.pumpAndSettle(Duration(milliseconds: 400));
    final titleTapForSearch = find.text("Tap for search.");

    expect(titleTapForSearch, findsOneWidget);
    final markersListTile = find.byType(MarkersListTile);
    expect(markersListTile, findsNWidgets(2));

    await testSearch(
      search: "a",
      count: 5,
      tester: tester,
      typeTextField: typeTextField,
    );
    await testSearch(
      search: "p",
      count: 3,
      tester: tester,
      typeTextField: typeTextField,
    );
    await testSearch(
      search: "pernambuco",
      count: 1,
      tester: tester,
      typeTextField: typeTextField,
    );
    await testSearch(
      search: "alagoas",
      count: 1,
      tester: tester,
      typeTextField: typeTextField,
    );
  });
  testWidgets("Test CitiesAutoCompleteField clear IconButton Click",
      (WidgetTester tester) async {
    await pumpAutoCompleteWidget(tester, globalSettings);
    await tester.pumpAndSettle(Duration(milliseconds: 400));

    final typeTextField = find.byType(TextField);

    await tester.tap(typeTextField);

    Finder clearIconButton = findClearIconButton();

    await tester.pumpAndSettle(Duration(milliseconds: 400));

    Finder markersListTile = find.byType(MarkersListTile);

    expect(markersListTile, findsNWidgets(2));

    await testSearch(
      search: "a",
      count: 5,
      tester: tester,
      typeTextField: typeTextField,
    );
    await tester.tap(typeTextField);
    await testTapClearIconButton(tester, clearIconButton, markersListTile);
  });
}

Finder findClearIconButton() {
  final clearIconButton = find.byWidgetPredicate((Widget widget) {
    return widget is FaIcon && widget.icon == FontAwesomeIcons.times;
  });
  expect(clearIconButton, findsOneWidget);
  return clearIconButton;
}

Future testTapClearIconButton(
    WidgetTester tester, Finder clearIconButton, Finder markersListTile) async {
  await tester.pumpAndSettle(Duration(milliseconds: 400));
  await tester.tap(clearIconButton);
  await tester.pumpAndSettle(Duration(milliseconds: 400));
  markersListTile = find.byType(MarkersListTile);
  expect(markersListTile, findsNWidgets(2));
}

Future<void> testSearch(
    {String search,
    int count,
    WidgetTester tester,
    Finder typeTextField}) async {
  await tester.enterText(typeTextField, search);
  await tester.pumpAndSettle();
  expect(find.text(search), findsOneWidget);

  await tester.pumpAndSettle(Duration(milliseconds: 500));
  final markersListTile = find.byType(MarkersListTile);
  expect(markersListTile, findsNWidgets(count));
}

Future<void> pumpAutoCompleteWidget(
    WidgetTester tester, GlobalSettingsController globalSettings) {
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
void visibleAndHideWidget(Type visible, Type hide){
    expect(find.byType(visible), findsOneWidget);
    expect(find.byType(hide), findsNothing);
  }
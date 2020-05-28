import 'package:corona_data/app/modules/charts/widgets/animated_line_chart_widget/options_bar_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/chart_settings/chart_settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../helpers/charts_module_init_helper.dart';
import '../../../../../helpers/extensions/fa_icon_finder.dart';

main() {
  InitChartsModuleHelper().load();

  setUp(() {});
  
  testWidgets('OptionsBarWidget has close button', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(MaterialApp(
      home: Scaffold(body: OptionsBarWidget()),
    )));

    final closeButtonFinder = find.byFaIcon(FontAwesomeIcons.times);

    expect(closeButtonFinder, findsOneWidget);
  });

  testWidgets('OptionsBarWidget has ChartSettingsWidget',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(MaterialApp(
      home: Scaffold(body: OptionsBarWidget()),
    )));

    final settingsWidgetFinder = find.byType(ChartSettingsWidget);

    expect(settingsWidgetFinder, findsOneWidget);
  });
}

import 'package:corona_data/app/modules/charts/widgets/animated_line_chart_widget/caption_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/animated_line_chart_widget/captions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  setUp(() {
    
  });

  testWidgets('CaptionsWidget has Column', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CaptionsWidget(screenWidth: 480,)));
    
    await tester.pumpAndSettle();

    final columnFinder = find.byType(Column);

    expect(columnFinder, findsOneWidget);
  });

  testWidgets('CaptionsWidget has three CaptionWidget', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CaptionsWidget(screenWidth: 480,)));
    
    await tester.pumpAndSettle();

    final captionFinder = find.byType(CaptionWidget);

    expect(captionFinder, findsNWidgets(3));
  });

  testWidgets('CaptionsWidget has total cases caption', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CaptionsWidget(screenWidth: 480,)));
    
    await tester.pumpAndSettle();

    final captionFinder = find.byType(CaptionWidget);
    final labelFinder = find.descendant(of: captionFinder, matching: find.text('Total cases'));

    expect(labelFinder, findsOneWidget);
  });

  testWidgets('CaptionsWidget has number of deaths caption', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CaptionsWidget(screenWidth: 480,)));
    
    await tester.pumpAndSettle();

    final captionFinder = find.byType(CaptionWidget);
    final labelFinder = find.descendant(of: captionFinder, matching: find.text('Number of deaths'));

    expect(labelFinder, findsOneWidget);
  });

  testWidgets('CaptionsWidget has recovered patients caption', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CaptionsWidget(screenWidth: 480,)));
    
    await tester.pumpAndSettle();

    final captionFinder = find.byType(CaptionWidget);
    final labelFinder = find.descendant(of: captionFinder, matching: find.text('Recovered patients'));

    expect(labelFinder, findsOneWidget);
  });

}
import 'package:corona_data/app/modules/charts/widgets/animated_line_chart_widget/caption_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  Color red;
  String label;
  setUp(() {
    red = Colors.red;
    label = "Label Teste";
  });

  testWidgets('CaptionWidget has Row', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CaptionWidget(color: red, label: label)));

    final rowFinder = find.byType(Row);

    expect(rowFinder, findsOneWidget);
  });

  testWidgets('CaptionWidget has label', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CaptionWidget(color: red, label: label)));

    final rowFinder = find.byType(Row);
    final textFinder =
        find.descendant(of: rowFinder, matching: find.text(label));

    expect(textFinder, findsOneWidget);
  });

  testWidgets('CaptionWidget has red container', (WidgetTester tester) async {
    Color red = Colors.red;
    String label = "Label Teste";

    await tester.pumpWidget(
        buildTestableWidget(CaptionWidget(color: red, label: label)));

    final rowFinder = find.byType(Row);
    final colorWidgetFinder =
        find.descendant(of: rowFinder, matching: ContainerByColorFinder(red));

    expect(colorWidgetFinder, findsOneWidget);
  });

  testWidgets('CaptionWidget has green container', (WidgetTester tester) async {
    Color green = Colors.green;

    await tester.pumpWidget(
        buildTestableWidget(CaptionWidget(color: green, label: label)));

    final rowFinder = find.byType(Row);
    final colorWidgetFinder =
        find.descendant(of: rowFinder, matching: ContainerByColorFinder(green));

    expect(colorWidgetFinder, findsOneWidget);
  });
}

class ContainerByColorFinder extends MatchFinder {
  ContainerByColorFinder(this.color, {bool skipOffstage = true})
      : super(skipOffstage: skipOffstage);

  final Color color;

  @override
  String get description => 'Container{color: "$color"}';

  @override
  bool matches(Element candidate) {
    if (candidate.widget is Container) {
      final Container containerWidget = candidate.widget;

      if (containerWidget.decoration is BoxDecoration) {
        final BoxDecoration decoration = containerWidget.decoration;
        return decoration.color == color;
      }
      return containerWidget.color == color;
    }
    return false;
  }
}

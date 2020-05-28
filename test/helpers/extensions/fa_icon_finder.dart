import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

extension FaIconFinder on CommonFinders {
  Finder byFaIcon(IconData iconData, {bool skipOffstage = true}) {
    return find.byWidgetPredicate(
        (widget) => widget is FaIcon && widget.icon == iconData,
        skipOffstage: skipOffstage);
  }
}

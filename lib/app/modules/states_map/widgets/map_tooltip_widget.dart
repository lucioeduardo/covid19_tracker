import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/shared/models/marker_data_model_interface.dart';
import 'package:corona_data/app/shared/widgets/roudend_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../translations/states_map.i18n.dart';

class MapTooltipWidget extends StatelessWidget {
  MapTooltipWidget({
    Key key,
    @required this.stateModel,
    this.onTap,
  }) : super(key: key);

  final IMarkerModelData stateModel;
  final GlobalSettingsController globalSettingsController = Modular.get();
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 200.0),
        curve: Curves.elasticOut,
        duration: Duration(milliseconds: 1000),
        builder: (_, width, __) {
          return Container(
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: Theme.of(context).primaryColorDark,
              shape: TooltipShapeBorder(arrowArc: 0.5),
              shadows: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4.0,
                  offset: Offset(2, 2),
                )
              ],
            ),
            width: width,
            height: width / 1.3,
            child: GestureDetector(
              child: width > 180
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              stateModel.shortTitle.i18n,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "${stateModel.confirmed} ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: globalSettingsController
                                        .theme.extraPallete.warning,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Case'.plural(2),
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "${stateModel.deaths} ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: globalSettingsController
                                        .theme.extraPallete.error,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Death'.plural(2),
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                              child: RoundedIconButton(
                            onPressed: onTap,
                            title: "Chart".i18n,
                            iconData: FontAwesomeIcons.chartBar,
                          ))
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          );
        });
  }
}

class TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double arrowArc;
  final double radius;

  TooltipShapeBorder({
    this.radius = 16.0,
    this.arrowWidth = 20.0,
    this.arrowHeight = 10.0,
    this.arrowArc = 0.0,
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    rect = Rect.fromPoints(
        rect.topLeft, rect.bottomRight - Offset(0, arrowHeight));
    double x = arrowWidth, y = arrowHeight, r = 1 - arrowArc;
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.bottomCenter.dx + x / 2, rect.bottomCenter.dy)
      ..relativeLineTo(-x / 2 * r, y * r)
      ..relativeQuadraticBezierTo(
          -x / 2 * (1 - r), y * (1 - r), -x * (1 - r), 0)
      ..relativeLineTo(-x / 2 * r, -y * r);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

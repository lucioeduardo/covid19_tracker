import 'package:corona_data/app/shared/models/state_model.dart';
import 'package:flutter/material.dart';

class MapTooltipWidget extends StatelessWidget {
  const MapTooltipWidget({
    Key key,
    @required this.stateModel,
  }) : super(key: key);

  final StateModel stateModel;

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
              color: Colors.white,
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
            height: width / 2,
            child: GestureDetector(
              onTap: () => debugPrint("Popup tap!"),
              child: width > 150
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${stateModel.confirmed} casos",
                          overflow: TextOverflow.visible,
                        ),
                        Text(
                          "${stateModel.deaths} mortes",
                          overflow: TextOverflow.visible,
                        )
                      ],
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleMarker extends StatelessWidget {
  const CircleMarker({
    Key key,
    @required this.shortTitle,
    @required this.color,
    @required this.size,
    @required this.child,
  }) : super(key: key);

  final String shortTitle;
  final Color color;
  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 3),
      ),
      child: Container(
        width: size - 10,
        height: size - 10,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}





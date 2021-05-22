import 'package:flutter/material.dart';

class ClickAnimation extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final BorderRadius borderRadius;

  const ClickAnimation({Key key, this.onTap, this.borderRadius, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
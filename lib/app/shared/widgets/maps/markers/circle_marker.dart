import 'dart:math';

import 'package:flutter/material.dart';

class CustomCircleMarker extends StatefulWidget {
  const CustomCircleMarker({
    Key key,
    @required this.shortTitle,
    @required this.color,
    @required this.size,
    @required this.child, this.isAnimate=true, this.onEnd,
  }) : super(key: key);

  final String shortTitle;
  final Color color;
  final double size;
  final Widget child;
  final bool isAnimate;
  final Function() onEnd;
  
  @override
  _CustomCircleMarkerState createState() => _CustomCircleMarkerState();
}

class _CustomCircleMarkerState extends State<CustomCircleMarker> {

  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      onEnd: widget.onEnd != null? widget.onEnd:null,
      duration: Duration(milliseconds: 300 + Random().nextInt(1500)),
      tween: Tween(begin: widget.isAnimate ? 0.0 : 1.0, end: 1.0),  
      builder: (_, opacity, __) => Opacity(
          opacity: opacity,
          child: Container(
            alignment: Alignment.center,
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: widget.color, width: 3),
            ),
            child: Container(
              width: widget.size - 10,
              height: widget.size - 10,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
              child: widget.child,
            ),
          )),
    );

    
  }
}

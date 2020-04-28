import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:flutter/material.dart';

class FadedListView extends StatelessWidget {
  final AnimationController controller;
  final double begin;
  final double end;
  final double tick;
  final List<Widget> children;
  final Curve curve;
  final List<Animation> animations = [];
  final Widget rearWidget;

  FadedListView({
    Key key,
    this.controller,
    this.children,
    this.begin = 0.0,
    this.curve = Curves.ease,
    this.end = 1.0,
    this.tick,
    this.rearWidget,
  }) : super(key: key) {
    Interval interval;
    for (var child in children) {
      interval = _getInterval(
        children.length,
        begin,
        children.indexOf(child),
        curve: curve,
      );
      animations.add(CurvedAnimation(parent: controller, curve: interval));
    }

    
  }

  Interval _getInterval(int size, double _begin, int index, {Curve curve}) {
    // double timeAvaliable = (end - _begin);
    // double tick = timeAvaliable / size;
    _begin += _tick * index;
    double _end = _begin + _tick;
    return Interval(_begin, _end, curve: curve);
  }

  double get _tick =>
      tick != null && tick != 0.0 ? tick : (_timeAvaliable) / children.length;
  double get _timeAvaliable => end - begin;

  @override
  Widget build(BuildContext context) {
    if(controller.value >= begin){
        return ListView.builder(
            itemCount: children.length,
            itemBuilder: (context, index) {
              return Opacity(
                  opacity: animations[index].value.clamp(0.0, 1.0),
                  child: children[index]);
            });
    }else if(controller.value < begin){
      
      return rearWidget != null?rearWidget:SizedBox.shrink();
    }
         
        
  }
}

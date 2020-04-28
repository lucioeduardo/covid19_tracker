import 'package:flutter/material.dart';

class FadedListView extends StatelessWidget {
  final AnimationController controller;
  final double begin;
  final double end;
  final List<Widget> children;
  final Curve curve;
  final List<Animation> animations=[];

  FadedListView({Key key, this.controller, this.children, this.begin=0.0, this.curve=Curves.ease, this.end=1.0}) : super(key: key){
    Interval interval;
    for (var child in children) {
      interval = _getInterval(children.length, begin, children.indexOf(child), curve: curve,);
      animations.add(
        CurvedAnimation(parent: controller, curve: interval)
      );
    }
  }

  Interval _getInterval(int size, double _begin, int index,{Curve curve}){
    double timeAvaliable = (end - _begin);
    double tick = timeAvaliable/size;
    _begin += tick * index;
    double _end = _begin + tick;
    return Interval(_begin,_end, curve: curve);

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: children.length,itemBuilder: (context, index){
      return Opacity(
        opacity: animations[index].value.clamp(0.0,1.0)
        ,child: children[index]);
    });
  }
  
}
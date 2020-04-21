import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

enum WashingHandsAnimations {
  default_animation,
}

class WashingHandsAnimation extends StatelessWidget {
  final WashingHandsAnimations animation;
  final BoxFit fit;

  static const Map<WashingHandsAnimations, String> virusAnimationMap = {
    WashingHandsAnimations.default_animation: "default",
  };

  const WashingHandsAnimation({Key key, this.animation, this.fit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlareActor("assets/animations/wash_hands.flr",
        animation: virusAnimationMap[animation], fit: fit);
  }
}

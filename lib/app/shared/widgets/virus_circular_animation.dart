import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

enum VirusAnimation{
  default_animation,
  double_rotatation,
  rotation_sfs,
  rotation_fss,
  rotation_fast

}

class VirusCircularAnimation extends StatelessWidget {
  final VirusAnimation animation;
  final BoxFit fit;
  
  static const Map<VirusAnimation,String> virusAnimationMap = {
    VirusAnimation.default_animation: "default",
    VirusAnimation.double_rotatation: "double_rotatation",
    VirusAnimation.rotation_sfs: "rotation_sfs",
    VirusAnimation.rotation_fss: "rotation_fss",
    VirusAnimation.rotation_fast: "rotation_fast",
  };

  VirusCircularAnimation(this.animation, this.fit);

  @override
  Widget build(BuildContext context) {
    return FlareActor(
                  "assets/animations/virus_loading_multiple.flr",
                  animation: virusAnimationMap[animation],
                  fit:fit
                );
          
  }
}
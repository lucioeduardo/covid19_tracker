import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

enum VirusInfectionAnimation{
  default_animation,
  double_rotatation,
  rotation_sfs,
  rotation_fss,
  rotation_fast

}

class VirusInfectionCircularAnimation extends StatelessWidget {
  final VirusInfectionAnimation animation;
  final BoxFit fit;
  final double size;
  
  static const Map<VirusInfectionAnimation,String> virusAnimationMap = {
    VirusInfectionAnimation.default_animation: "default",
  };

  VirusInfectionCircularAnimation({this.animation, this.fit, this.size=AnimationSizes.medium});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: FlareActor(
                    "assets/animations/splash_infection.flr",
                    animation: virusAnimationMap[animation],
                    fit:fit,
                    
                  ),
    );
          
  }
}
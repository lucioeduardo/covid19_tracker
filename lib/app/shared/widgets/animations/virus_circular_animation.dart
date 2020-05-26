import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

enum VirusAnimation{
  default_animation,
  double_rotatation,
  rotation_sfs,
  rotation_fss,
  rotation_fast

}

class VirusCircularAnimation extends StatelessWidget{
  final VirusAnimation animation;
  final BoxFit fit;
  final double size;
  
  
  static const Map<VirusAnimation,String> virusAnimationMap = {
    VirusAnimation.default_animation: "default",
    VirusAnimation.double_rotatation: "double_rotatation",
    VirusAnimation.rotation_sfs: "rotation_sfs",
    VirusAnimation.rotation_fss: "rotation_fss",
    VirusAnimation.rotation_fast: "rotation_fast",
  };

  VirusCircularAnimation({this.animation, this.fit, this.size=AnimationSizes.medium});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: FlareActor(
        
                    "assets/animations/virus_loading_multiple.flr",
                    animation: virusAnimationMap[animation],
                    
                    fit:fit
                  ),
    );
          
  }

  
}
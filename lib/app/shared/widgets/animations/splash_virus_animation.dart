import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

enum SplashVirusAnimations{
  default_animation,
  dangerous,
  

}

class SplashVirusAnimation extends StatelessWidget{
  final SplashVirusAnimations animation;
  final BoxFit fit;
  final double width;
  final double heigth;
  
  static const Map<SplashVirusAnimations,String> virusAnimationMap = {
    SplashVirusAnimations.default_animation: "default",
    SplashVirusAnimations.dangerous: "dangerous",
  };

  SplashVirusAnimation({this.animation, this.fit, this.width, this.heigth,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      child: FlareActor(
                    "assets/animations/splash_virus_animarion.flr",
                    animation: virusAnimationMap[animation],
                    fit:fit,

                  ),
    );
          
  }

  
}
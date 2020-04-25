import 'dart:async';

import 'package:corona_data/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final AppController appController = Modular.get();

  @observable
  bool _timer = false;

  _SplashControllerBase() {
    appController.globalSettingsController.init();
    setupTimer();
    setupReactions();
  }

  void setupTimer() async {
    Timer(Duration(seconds: 2), () => _timer = true);
  }

  void setupReactions() async {
    when((_) => (appController.globalSettingsController.isReady && _timer), () {
      Modular.to.pushReplacementNamed("/home");
    });
  }
  
}

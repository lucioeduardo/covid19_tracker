import 'dart:async';

import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/modules/home/repositories/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final ILocalStorage localStorage = Modular.get();
  final AppController appController = Modular.get();

  @observable
  ObservableFuture<bool> themeDark;

  @observable
  bool _timer = false;

  _SplashControllerBase() {
    getTheme();
    appController.getCountry();
    setupTimer();
    setupReactions();
  }

  void setupTimer() async {
    Timer(Duration(seconds: 2), () => _timer = true);
  }

  void setupReactions() async {
    when((_) => (themeDark.value != null && _timer), () {
      appController.setTheme(themeDark.value);
      Modular.to.pushReplacementNamed("/home");
    });
  }

  @action
  void getTheme() {
    themeDark = localStorage.isThemeDark().asObservable();
  }
  
  
}

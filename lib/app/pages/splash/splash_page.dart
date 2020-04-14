import 'package:corona_data/app/pages/splash/splash_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            child: FlareActor(
                "assets/virus_loading.flr",
                animation: "default",
                fit:BoxFit.contain
              ),
          ),
        ));
  }
}

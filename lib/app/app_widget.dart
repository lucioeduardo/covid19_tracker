import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  final AppController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp(
        navigatorKey: Modular.navigatorKey,
        title: 'Flutter Slidy',
        theme: controller.theme,
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      );
    });
  }
}

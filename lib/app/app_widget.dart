import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'app_controller.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    reaction((_) => controller.globalSettingsController.theme, (_) =>  (setState((){})));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: controller.globalSettingsController.theme,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

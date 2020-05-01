import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';
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
      title: 'C19 Tracker',
      theme: controller.globalSettingsController.theme.themeData,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      localizationsDelegates: [            
               GlobalMaterialLocalizations.delegate,
               GlobalWidgetsLocalizations.delegate,
               GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
               const Locale('en', "US"), 
               const Locale('pt', "BR"), 
            ],
      builder: (context,widget){
        
        return I18n(
          initialLocale: controller.globalSettingsController.locale.getLocale(),
          child:widget
          );
      },
      
    );
  }
}

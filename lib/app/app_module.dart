import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:corona_data/app/pages/splash/splash_controller.dart';
import 'package:corona_data/app/app_controller.dart';
import 'package:corona_data/app/modules/home/home_module.dart';
import 'package:corona_data/app/modules/settings/settings_module.dart';
import 'package:corona_data/app/pages/splash/splash_page.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:corona_data/app/app_widget.dart';

import 'shared/repositories/local_storage_hive.dart';
import 'shared/repositories/local_storage_interface.dart';


class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => GlobalSettingsController()),
        Bind((i) => AppController()),
        Bind(
          (i) => Dio(BaseOptions(baseUrl: BASE_URL)),
        ),
        Bind<ILocalStorage>(
          (i) => LocalStorageHive(),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
        Router("/home", module: HomeModule()),
        Router("/settings", module: SettingsModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

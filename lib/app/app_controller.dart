import 'package:corona_data/app/modules/settings/global_settings_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {

  final GlobalSettingsController globalSettingsController = Modular.get();

  
}

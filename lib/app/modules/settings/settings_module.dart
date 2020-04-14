import 'package:corona_data/app/modules/settings/settings_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:corona_data/app/modules/settings/settings_page.dart';

class SettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SettingsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SettingsPage()),
      ];

  static Inject get to => Inject<SettingsModule>.of();
}

import 'package:corona_data/app/modules/country/country_controller.dart';
import 'package:corona_data/app/shared/repositories/covid_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:corona_data/app/modules/country/country_page.dart';

import '../../app_controller.dart';

class CountryModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => CountryController(i.get<ICovidRepository>(), i.get<AppController>())),
      ];

  static Inject get to => Inject<CountryModule>.of();

  @override
  Widget get view => CountryPage();
}

import 'package:projeto_pp/app/modules/country/country_page.dart';
import 'package:projeto_pp/app/modules/country/country_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CountryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CountryStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CountryPage(countryInfo: args.data,)),
  ];
}

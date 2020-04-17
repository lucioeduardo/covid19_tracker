import 'package:corona_data/app/modules/home/widgets/country/country_controller.dart';
import 'package:corona_data/app/modules/home/widgets/try_again/try_again_widget.dart';
import 'package:corona_data/app/shared/info_tile_widget.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CountryWidget extends StatefulWidget {
  final String title;
  const CountryWidget({Key key, this.title = "Brasil"}) : super(key: key);

  @override
  _CountryWidgetState createState() => _CountryWidgetState();
}

class _CountryWidgetState extends ModularState<CountryWidget, CountryController> {
  
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (controller.countryInfo.error != null) {
          return TryAgainWidget(onPressed: controller.fetchCountryInfo());
        } else {
          InfoModel info = controller.countryInfo.value;

          if (info == null) return Center(child: CircularProgressIndicator());

          return ListView(
            children: <Widget>[
              InfoTileWidget(
                number: "${info.cases}",
                title: "Número de Casos",
                todayNum: "${info.todayCases}",
              ),
              Container(
                height: 20,
              ),
              InfoTileWidget(
                number: "${info.deaths}",
                title: "Número de Mortes",
                todayNum: "${info.todayDeaths}",
              ),
              Container(
                height: 20,
              ),
              InfoTileWidget(
                number: "${info.critical}",
                title: "Pacientes em estado grave",
              ),
              Container(
                height: 20,
              ),
              InfoTileWidget(
                number: "${info.recovered}",
                title: "Pacientes recuperados",
              ),
            ],
          );
        }
      },
    );
  }
}

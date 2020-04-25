import 'package:corona_data/app/modules/charts/charts_module.dart';
import 'package:corona_data/app/modules/charts/widgets/country_cases/country_cases_widget.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/utils/modal_utils.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/info_tile_widget.dart';
import 'package:corona_data/app/shared/widgets/roudend_icon_button.dart';
import 'package:corona_data/app/shared/widgets/try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'country_controller.dart';

class CountryPage extends StatefulWidget {
  final String title;
  const CountryPage({Key key, this.title = "Brasil"}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState
    extends ModularState<CountryPage, CountryController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (controller.countryInfo.error != null) {
          return TryAgainWidget(onPressed: controller.fetchCountryInfo);
        } else {
          InfoModel info = controller.countryInfo.value;

          if (info == null)
            return Center(
              child: Container(
                  width: 150,
                  height: 150,
                  child: VirusCircularAnimation(
                      animation: VirusAnimation.rotation_fast,
                      fit: BoxFit.contain)),
            );

          return ListView(
            children: <Widget>[
              RoundedIconButton(
                iconData: FontAwesomeIcons.chartBar,
                onPressed: () =>
                    ModalUtils.showModal(context, ChartsModule(CountryCasesGraphWidget())),
              ),
              Container(
                height: 10,
              ),
              InfoTileWidget(
                number: "${info.cases}",
                title: "Número de Casos",
                todayNum: "${info.todayCases}",
                // button: RoundedIconButton(
                //   iconData: FontAwesomeIcons.chartBar,
                //   onPressed: () =>
                //       ModalUtils.showModal(context, CountryCasesGraphWidget()),
                // ),
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

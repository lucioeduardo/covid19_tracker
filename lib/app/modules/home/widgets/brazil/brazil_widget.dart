import 'package:corona_data/app/modules/home/widgets/brazil/brazil_controller.dart';
import 'package:corona_data/app/shared/info_tile_widget.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BrazilWidget extends StatefulWidget {
  final String title;
  const BrazilWidget({Key key, this.title = "Brasil"}) : super(key: key);

  @override
  _BrazilWidgetState createState() => _BrazilWidgetState();
}

class _BrazilWidgetState extends ModularState<BrazilWidget, BrazilController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (controller.brazilInfo.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Não foi possível acessar os dados.',
                  style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 16),
                ),
                Container(
                  height: 10,
                ),
                FlatButton(
                    onPressed: controller.fetchBrazilInfo,
                    color: Theme.of(context).accentColor,
                    child: Text('Tentar novamente')),
              ],
            ),
          );
        } else {
          InfoModel info = controller.brazilInfo.value;

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

import 'package:corona_data/app/modules/home/pages/brazil/brazil_controller.dart';
import 'package:corona_data/app/shared/info_tile_widget.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BrazilPage extends StatefulWidget {
  final String title;
  const BrazilPage({Key key, this.title = "Brasil"}) : super(key: key);

  @override
  _BrazilPageState createState() => _BrazilPageState();
}

class _BrazilPageState extends State<BrazilPage> {
  final brazilController = Modular.get<BrazilController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (brazilController.brazilInfo.error != null) {
          return Center(
            child: Text("ERRO!", style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 24
            ),),
          );
        } else {
          InfoModel info = brazilController.brazilInfo.value;

          if (info == null) return Center(child: CircularProgressIndicator());

          return ListView(
            children: <Widget>[
              InfoTileWidget(
                number: "${info.numCases}",
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

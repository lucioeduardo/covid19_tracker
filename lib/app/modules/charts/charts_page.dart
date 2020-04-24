import 'package:corona_data/app/modules/charts/widgets/caption_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/line_chart_widget.dart';
import 'package:corona_data/app/modules/home/widgets/try_again/try_again_widget.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'interfaces/chart_controller_interface.dart';


class ChartsPage extends StatefulWidget {
  final IChartController controller;

  const ChartsPage({Key key, @required this.controller})
      : super(key: key);

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (widget.controller.graphData.error != null) {
        return TryAgainWidget(onPressed: widget.controller.fetchGraphData);
      }

      if (widget.controller.graphData.value != null) {
        Map<String, List<int>> values = widget.controller.graphData.value;
        return Column(
          children: <Widget>[
            LineChartWidget(values: values),
            Container(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Theme.of(context).accentColor.withAlpha(50),
              ),
              child: Column(
                children: <Widget>[
                  CaptionWidget(color: Colors.red, label: "Número de casos"),
                  CaptionWidget(color: Colors.black, label: "Número de mortes"),
                  CaptionWidget(
                      color: Colors.green, label: "Número de recuperados"),
                ],
              ),
            ),
          ],
        );
      }

      return Center(
          child: Container(
        width: 80,
        height: 80,
        child: VirusCircularAnimation(
            animation: VirusAnimation.rotation_fast, fit: BoxFit.contain),
      ));
    });
  }
}

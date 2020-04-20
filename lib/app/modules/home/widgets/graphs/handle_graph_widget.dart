import 'package:corona_data/app/modules/home/widgets/graphs/line_chart_widget.dart';
import 'package:corona_data/app/modules/home/widgets/try_again/try_again_widget.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'chart_controller_interface.dart';


class HandleGraphWidget extends StatefulWidget {
  final IChartController controller;

  const HandleGraphWidget({Key key, @required this.controller}) : super(key: key);

  @override
  _HandleGraphWidgetState createState() => _HandleGraphWidgetState();
}

class _HandleGraphWidgetState extends State<HandleGraphWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (widget.controller.graphData.error != null) {
        return TryAgainWidget(onPressed: widget.controller.fetchGraphData);
      }

      if (widget.controller.graphData.value != null) {
        List<int> values = widget.controller.graphData.value;
        return Column(
          children: <Widget>[
            LineChartWidget(values: values),
            Container(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Número de casos ao longo dos últimos 30 dias",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor),
              ),
            ),
          ],
        );
      }

      return Center(child: Container(
        width: 80,
        height: 80,
        child: VirusCircularAnimation(
                        animation: VirusAnimation.rotation_fast,
                        fit: BoxFit.contain),
      ));
            
    });
  }
}
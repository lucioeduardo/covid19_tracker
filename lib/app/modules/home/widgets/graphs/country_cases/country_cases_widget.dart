import 'package:corona_data/app/modules/home/widgets/graphs/country_cases/country_cases_controller.dart';
import 'package:corona_data/app/modules/home/widgets/graphs/line_chart_widget.dart';
import 'package:corona_data/app/modules/home/widgets/try_again/try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CountryCasesGraphWidget extends StatefulWidget {
  @override
  _CountryCasesGraphWidgetState createState() => _CountryCasesGraphWidgetState();
}

class _CountryCasesGraphWidgetState
    extends ModularState<CountryCasesGraphWidget, CountryCasesController> {

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.graphData.error != null) {
        return TryAgainWidget(onPressed: controller.fetchGraphData);
      }

      if (controller.graphData.value != null) {
        List<int> values = controller.graphData.value;
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

      return CircularProgressIndicator();
    });
  }
}

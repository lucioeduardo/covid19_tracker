import 'package:corona_data/app/modules/home/widgets/graphs/world_cases/world_cases_controller.dart';
import 'package:corona_data/app/modules/home/widgets/try_again/try_again_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:number_display/number_display.dart';

class WorldCasesGraphWidget extends StatefulWidget {
  @override
  _WorldCasesGraphWidgetState createState() => _WorldCasesGraphWidgetState();
}

class _WorldCasesGraphWidgetState
    extends ModularState<WorldCasesGraphWidget, WorldCasesController> {
  final display = createDisplay(length: 4);
  final DateFormat dateFormat = DateFormat("dd/MM");

  String getDateFormatted(value) {
    return dateFormat
        .format(DateTime.now().subtract(Duration(days: 30 - value)));
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.graphData.error != null) {
        return TryAgainWidget(onPressed: controller.fetchGraphData);
      }

      if (controller.graphData.value != null) {
        List<int> values = controller.graphData.value;

        List<FlSpot> chartData = [];
        for (int i = 0; i < values.length; i++) {
          chartData.add(FlSpot(i.toDouble(), (values[i]).toDouble()));
        }

        int maxValue = values[values.length-1];
        int interval = maxValue~/4;

        return LineChart(
          LineChartData(
            borderData: FlBorderData(show: true, border: Border.all(color: Theme.of(context).accentColor)),
            backgroundColor: Theme.of(context).primaryColor,
            maxY: maxValue * 1.05,
            lineTouchData: LineTouchData(

                enabled: true, touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Theme.of(context).primaryColorLight,
                  
                  getTooltipItems: (spots){
                    return spots.map((spot) => LineTooltipItem("${getDateFormatted(spot.x.toInt())}: ${display(spot.y)}", TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark))).toList();
                  }
                )),
            lineBarsData: [
              LineChartBarData(
                spots: chartData,
                isCurved: true,
                barWidth: 1.5,
                colors: [
                  Colors.red[800],
                ],
                dotData: FlDotData(
                  show: false,
                ),
              ),
            ],
            minY: 0,
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                  showTitles: true,
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                  getTitles: (value) {
                    int valueInt = value.toInt() + 1;
                    if (valueInt % 10 == 0) {
                      return "${getDateFormatted(valueInt)}";
                    }
                    return '';
                  }),
              leftTitles: SideTitles(
                reservedSize: 30,
                showTitles: true,
                textStyle: TextStyle(color: Theme.of(context).accentColor),
                interval: interval.toDouble(),
                getTitles: (value) {
                  return '${display(value)}';
                },
              ),
            ),
            gridData: FlGridData(
              show: true,
              checkToShowHorizontalLine: (double value) {
                return value == values[9] || value == values[19];
              },
            ),
          ),
        );
      }

      return CircularProgressIndicator();
    });
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:number_display/number_display.dart';

class LineChartWidget extends StatefulWidget {
  final List<int> values;

  LineChartWidget({Key key, @required this.values}) : super(key: key);

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<FlSpot> chartData = [];
  int maxValue, interval, lastDays;

  final display = createDisplay(length: 4);
  final DateFormat dateFormat = DateFormat("dd/MM");

  @override
  initState() {
    super.initState();
    maxValue = widget.values[widget.values.length - 1];
    for (int i = 0; i < widget.values.length; i++) {
      chartData.add(FlSpot(i.toDouble(), (widget.values[i]).toDouble()));
    }
    interval = maxValue ~/ 4;
    lastDays = widget.values.length;
  }

  String getDateFormatted(value) {
    return dateFormat
        .format(DateTime.now().toUtc().subtract(Duration(days: lastDays - value + 1)));
  }

  HorizontalLine makeHorizontalLine(value) {
    return HorizontalLine(
        y: value,
        color: Theme.of(context).accentColor.withAlpha(70),
        strokeWidth: 1,
        label: HorizontalLineLabel(
            style: TextStyle(color: Theme.of(context).accentColor.withAlpha(200)),
            labelResolver: (line) => display(line.y)));
  }

  @override
  Widget build(BuildContext context) {
    final borderData = FlBorderData(
        show: true, border: Border.all(color: Theme.of(context).accentColor));

    final extraLinesData = ExtraLinesData(horizontalLines: [
      makeHorizontalLine(widget.values[0].toDouble()),
      makeHorizontalLine(widget.values[9].toDouble()),
      makeHorizontalLine(widget.values[19].toDouble()),
    ]);

    final lineTouchData = LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Theme.of(context).primaryColorLight,
            getTooltipItems: (spots) {
              return spots
                  .map((spot) => LineTooltipItem(
                      "${getDateFormatted(spot.x.toInt()+1)}: ${display(spot.y)}",
                      TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark)))
                  .toList();
            }));

    final lineBarsData = [
      LineChartBarData(
        spots: chartData,
        isCurved: true,
        barWidth: 1.5,
        colors: [
          Colors.red[800],
        ],
        dotData: const FlDotData(
          show: false,
        ),
      ),
    ];

    final titlesData = FlTitlesData(
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
    );

    return LineChart(
      LineChartData(
        extraLinesData: extraLinesData,
        borderData: borderData,
        backgroundColor: Theme.of(context).primaryColor,
        maxY: maxValue * 1.05,
        lineTouchData: lineTouchData,
        lineBarsData: lineBarsData,
        minY: 0,
        titlesData: titlesData,
        gridData: const FlGridData(
          show: false,
        ),
      ),
    );
  }
}

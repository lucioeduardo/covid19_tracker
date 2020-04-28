import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:number_display/number_display.dart';

class LineChartWidget extends StatefulWidget {
  final Map<String, List<int>> values;
  final bool showCases, showDeaths, showRecovered;

  LineChartWidget({Key key, @required this.values, @required this.showCases, @required this.showDeaths, @required this.showRecovered}) : super(key: key);

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<FlSpot> cases = [], deaths = [], recovered = [], zeroLine = [];
  int maxValue, interval, lastDays;

  final display = createDisplay(length: 4);
  final DateFormat dateFormat = DateFormat("dd/MM");

  @override
  initState() {
    super.initState();
    final int length = widget.values['cases'].length;

    maxValue = max(
        widget.values['cases'][length - 1],
        max(widget.values['deaths'][length - 1],
            widget.values['recovered'][length - 1]));

    for (int i = 0; i < length; i++) {
      zeroLine.add(FlSpot(i.toDouble(),0.0));
      cases.add(FlSpot(i.toDouble(), (widget.values['cases'][i]).toDouble()));
      deaths.add(FlSpot(i.toDouble(), (widget.values['deaths'][i]).toDouble()));
      recovered.add(
          FlSpot(i.toDouble(), (widget.values['recovered'][i]).toDouble()));
    }
    interval = maxValue ~/ 4;
    lastDays = widget.values['cases'].length;
  }

  String getDateFormatted(value) {
    return dateFormat.format(
        DateTime.now().toUtc().subtract(Duration(days: lastDays - value + 1)));
  }

  HorizontalLine makeHorizontalLine(value) {
    return HorizontalLine(
        y: value,
        color: Theme.of(context).accentColor.withAlpha(70),
        strokeWidth: 1,
        label: HorizontalLineLabel(
            style:
                TextStyle(color: Theme.of(context).accentColor.withAlpha(200)),
            labelResolver: (line) => display(line.y)));
  }

  @override
  Widget build(BuildContext context) {
    final borderData = FlBorderData(
        show: true, border: Border.all(color: Theme.of(context).accentColor));

    final lineTouchData = LineTouchData(
      enabled: true,
      touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Theme.of(context).primaryColorLight,
          getTooltipItems: (spots) {
            return spots
                .map((spot) => LineTooltipItem(
                    "${display(spot.y)}",
                    TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: spot.bar.colors[0])))
                .toList();
          }),
    );

    final casesData = LineChartBarData(
      spots: widget.showCases ? cases : zeroLine,
      isCurved: true,
      barWidth: 1.5,
      colors: [
        widget.showCases ? Colors.red[800] : Colors.transparent,
      ],
      dotData: const FlDotData(
        show: false,
      ),
    );

    final deathsData = LineChartBarData(
      spots: widget.showDeaths ? deaths : zeroLine,
      isCurved: true,
      barWidth: 1.5,
      colors: [
        widget.showDeaths ? Colors.black : Colors.transparent,
      ],
      dotData: const FlDotData(
        show: false,
      ),
    );

    final recoveredData = LineChartBarData(
      spots: widget.showRecovered ? recovered : zeroLine,
      isCurved: true,
      barWidth: 1.5,
      colors: [
        widget.showRecovered ? Colors.green[800] : Colors.transparent,
      ],
      dotData: const FlDotData(
        show: false,
      ),
    );

    List<LineChartBarData> lineBarsData = [];
    maxValue = 0;
      
    lineBarsData.add(casesData);
    lineBarsData.add(recoveredData);
    lineBarsData.add(deathsData);

    if (widget.showCases) {
      maxValue = max(maxValue, widget.values['cases'].reduce(max));
    }
    if (widget.showRecovered) {
      maxValue = max(maxValue, widget.values['recovered'].reduce(max));
    }
    if (widget.showDeaths) {
      maxValue = max(maxValue, widget.values['deaths'].reduce(max));
    }

    final extraLinesData = ExtraLinesData(horizontalLines: [
      makeHorizontalLine(maxValue / 5),
      makeHorizontalLine(maxValue / 2.5),
      makeHorizontalLine(maxValue / 1.25),
    ]);

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

    return Column(
      children: <Widget>[
        LineChart(
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
          swapAnimationDuration: Duration(milliseconds: 500),
        ),
      ],
    );
  }
}

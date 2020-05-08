import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:number_display/number_display.dart';

class LineChartWidget extends StatefulWidget {
  final Map<String, List<int>> values;
  final bool showCases, showDeaths, showRecovered;

  LineChartWidget(
      {Key key,
      @required this.values,
      @required this.showCases,
      @required this.showDeaths,
      @required this.showRecovered})
      : super(key: key);

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
    lastDays = widget.values['cases'].length;
    _createLineData();
  }

  void _createLineData() {
    for (int i = 0; i < lastDays; i++) {
      zeroLine.add(FlSpot(i.toDouble(), 0.0));
      if (widget.showCases)
        cases.add(FlSpot(i.toDouble(), (widget.values['cases'][i]).toDouble()));
      if (widget.showDeaths)
        deaths
            .add(FlSpot(i.toDouble(), (widget.values['deaths'][i]).toDouble()));
      if (widget.showRecovered)
        recovered.add(
            FlSpot(i.toDouble(), (widget.values['recovered'][i]).toDouble()));
    }
  }

  String getDateFormatted(value) {
    return dateFormat.format(
        DateTime.now().toUtc().subtract(Duration(days: lastDays - value)));
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

  void _computeMaxValue() {
    maxValue = 0;

    if (widget.showCases)
      maxValue = max(maxValue, widget.values['cases'][lastDays - 1]);
    if (widget.showDeaths)
      maxValue = max(maxValue, widget.values['deaths'][lastDays - 1]);
    if (widget.showRecovered)
      maxValue = max(maxValue, widget.values['recovered'][lastDays - 1]);
  }

  @override
  Widget build(BuildContext context) {
    _computeMaxValue();
    interval = max(1,maxValue ~/ 4);

    print("Teste $interval");

    final borderData = FlBorderData(
        show: true, border: Border.all(color: Theme.of(context).accentColor));

    final lineTouchData = LineTouchData(
      enabled: true,
      touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Theme.of(context).primaryColorLight,
          getTooltipItems: (spots) {
            List<LineTooltipItem> tooltips = [];

            for (var spot in spots) {
              tooltips.add(LineTooltipItem(
                "${getDateFormatted(spot.x.toInt())}: ${display(spot.y)}",
                TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: spot.bar.colors[0]),
              ));
            }

            return tooltips;
          }),
    );

    final casesData = LineChartBarData(
      spots: widget.showCases ? cases : zeroLine,
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
      barWidth: 1.5,
      colors: [
        widget.showRecovered ? Colors.green[800] : Colors.transparent,
      ],
      dotData: const FlDotData(
        show: false,
      ),
    );

    final List<LineChartBarData> lineBarsData = [
      casesData,
      recoveredData,
      deathsData
    ];

    final extraLinesData = ExtraLinesData(horizontalLines: [
      makeHorizontalLine(maxValue / 5),
      makeHorizontalLine(maxValue / 2.5),
      makeHorizontalLine(maxValue / 1.25),
    ]);

    final titlesData = FlTitlesData(
      bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
              fontSize: 12,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold),
          getTitles: (value) {
            int valueInt = value.toInt();
            if ((valueInt+1) % 10 == 0) {
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

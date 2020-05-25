import 'package:flutter/material.dart';

import 'line_chart_widget.dart';
import '../../stores/chart_settings_store.dart';

class AnimatedLineChartWidget extends StatefulWidget {
  AnimatedLineChartWidget({
    Key key,
    @required this.values,
    @required this.settingsStore,
    @required this.hasRecoveredData,
  }) : super(key: key);

  final Map<String, List<int>> values;
  final ChartSettingsStore settingsStore;
  final bool hasRecoveredData;

  @override
  _AnimatedLineChartWidgetState createState() =>
      _AnimatedLineChartWidgetState();
}

class _AnimatedLineChartWidgetState extends State<AnimatedLineChartWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return FadeTransition(
      opacity: _animation,
      child: LineChartWidget(
        values: widget.values,
        showCases: widget.settingsStore.showCases,
        showDeaths: widget.settingsStore.showDeaths,
        showRecovered:
            widget.settingsStore.showRecovered && widget.hasRecoveredData,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

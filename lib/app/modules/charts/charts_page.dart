import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'interfaces/chart_controller_interface.dart';
import 'stores/chart_settings_store.dart';
import 'widgets/animated_line_chart_widget.dart';
import 'widgets/captions_widget.dart';
import 'widgets/options_bar_widget.dart';

class ChartsPage extends StatefulWidget {
  final IChartController controller;
  final bool hasRecoveredData;
  final String title;

  const ChartsPage(
      {Key key,
      @required this.controller,
      this.hasRecoveredData = true,
      @required this.title})
      : super(key: key);

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  ChartSettingsStore settingsStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          OptionsBarWidget(),
          Center(
            child: Text(
              "${widget.title}",
              style: GoogleFonts.robotoSlab(
                  fontSize: 32,
                  letterSpacing: -1.9,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Observer(
            builder: (_) {
              if (widget.controller.graphData.error != null) {
                return TryAgainWidget(
                    onPressed: widget.controller.fetchGraphData);
              }
              if (widget.controller.graphData.value != null) {
                Map<String, List<int>> values =
                    widget.controller.graphData.value;
                return Column(
                  children: <Widget>[
                    AnimatedLineChartWidget(
                      values: values,
                      settingsStore: settingsStore,
                      hasRecoveredData: widget.hasRecoveredData,
                    ),
                    Container(
                      height: 10,
                    ),
                    CaptionsWidget(screenWidth: screenWidth),
                  ],
                );
              }
              return Center(
                  child: VirusCircularAnimation(
                animation: VirusAnimation.rotation_fast,
                fit: BoxFit.contain,
                size: AnimationSizes.medium,
              ));
            },
          ),
        ],
      ),
    );
  }
}



import 'package:corona_data/app/modules/charts/widgets/caption_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/chart_settings/chart_settings_controller.dart';
import 'package:corona_data/app/modules/charts/widgets/chart_settings/chart_settings_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/line_chart_widget.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'translations/charts_page.i18n.dart';
import 'interfaces/chart_controller_interface.dart';

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
  ChartSettingsController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                color: Theme.of(context).primaryColorLight,
                icon: Icon(
                  Icons.close,
                ),
                onPressed: Navigator.of(context).pop,
              ),
              ChartSettingsWidget(),
            ],
          ),
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
                    TweenAnimationBuilder(
                        duration: Duration(milliseconds: 1000),
                        tween: Tween(begin: 0.0, end: 1.0),
                        curve: Curves.ease,
                        builder: (_, opacity, __) {
                          return Opacity(
                            opacity: opacity,
                            child: Observer(builder: (_) {
                              return LineChartWidget(
                                values: values,
                                showCases: controller.showCases,
                                showDeaths: controller.showDeaths,
                                showRecovered: controller.showRecovered &&
                                    widget.hasRecoveredData,
                              );
                            }),
                          );
                        }),
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
                      child: TweenAnimationBuilder(
                          duration: Duration(milliseconds: 1000),
                          tween: Tween<double>(
                            begin: screenWidth * 0.5,
                            end: screenWidth * 0.8,
                          ),
                          curve: Curves.elasticOut,
                          builder: (_, width, __) {
                            return Container(
                              width: width,
                              child: Column(
                                children: <Widget>[
                                  CaptionWidget(
                                      color: Colors.red,
                                      label: "Total cases".i18n),
                                  CaptionWidget(
                                      color: Colors.black,
                                      label: "Number of deaths".i18n),
                                  CaptionWidget(
                                      color: Colors.green,
                                      label: "Recovered patients".i18n),
                                ],
                              ),
                            );
                          }),
                    ),
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

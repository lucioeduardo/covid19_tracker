import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/utils/constants.dart';
import 'package:corona_data/app/shared/utils/widgets/summary_header_widget.dart';
import 'package:corona_data/app/shared/widgets/animations/faded_list_view.dart';
import 'package:corona_data/app/shared/widgets/animations/virus_circular_animation.dart';
import 'package:corona_data/app/shared/widgets/info_tile_widget.dart';
import 'package:corona_data/app/shared/widgets/percentage_badge_widget.dart';
import 'package:flutter/material.dart';

class WorldPageStaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final InfoModel info;

  WorldPageStaggerAnimation({Key key, this.controller, this.info})
      : super(key: key) {
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: controller,
        builder: _buildAnimation,
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget widget) {
    return FadedListView(
      controller: controller,
      begin: 0.4,
      end: 0.8,
      curve: Curves.easeInQuad,
      rearWidget: Center(
        child: VirusCircularAnimation(
          animation: VirusAnimation.rotation_fss,
          size: AnimationSizes.large,
          fit: BoxFit.cover,
        ),
      ),
      children: <Widget>[
        SummaryHeaderWidget(
          info: info,
          controller: controller,
          iconName: 'world',
        ),
        InfoTileWidget(
          padding: const EdgeInsets.only(top: 20.0),
          number: "${info.deaths}",
          todayNum: "${info.todayDeaths}",
          title: "Número de Mortes",
          percentageBadge: PercentageBadgeWidget(
            color: Color(0xffFF5656),
            percentage: (info.deaths) / (info.cases),
          ),
        ),
        InfoTileWidget(
          padding: const EdgeInsets.only(top: 20.0),
          number: "${info.recovered}",
          title: "Pacientes recuperados",
          percentageBadge: PercentageBadgeWidget(
            color: Color(0xff40CA87),
            percentage: (info.recovered) / (info.cases),
          ),
        ),
        InfoTileWidget(
          padding: const EdgeInsets.only(top: 20.0),
          number: "${info.critical}",
          title: "Pacientes em estado grave",
          percentageBadge: PercentageBadgeWidget(
            color: Color(0xffDBC716),
            percentage: (info.critical) / (info.cases),
          ),
        ),
        InfoTileWidget(
          padding: const EdgeInsets.only(top: 20.0),
          number: "${info.affectedCountries}",
          title: "Número de países afetados",
        ),
      ],
    );
  }
}

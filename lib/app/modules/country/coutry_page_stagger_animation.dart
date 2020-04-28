import 'package:corona_data/app/modules/charts/charts_module.dart';
import 'package:corona_data/app/modules/charts/widgets/country_cases/country_cases_widget.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/utils/modal_utils.dart';
import 'package:corona_data/app/shared/widgets/animations/faded_list_view.dart';
import 'package:corona_data/app/shared/widgets/info_tile_widget.dart';
import 'package:corona_data/app/shared/widgets/roudend_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoutryPageStaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final InfoModel info;
  final Animation<double> growAnimation;
  final Animation<double> fadeAnimationFirst;
  final Animation<double> fadeAnimationSecond;
  final Animation<double> fadeAnimationThird;
  final Animation<double> fadeAnimationFourth;

  CoutryPageStaggerAnimation({Key key, this.controller, this.info})
      : growAnimation = Tween<double>(begin: 0.0, end: 50.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.4, 0.7, curve: Curves.decelerate))),
        fadeAnimationFirst = CurvedAnimation(
            parent: controller,
            curve: Interval(0.4, 0.7, curve: Curves.decelerate)),
        fadeAnimationSecond = CurvedAnimation(
            parent: controller,
            curve: Interval(0.50, 0.75, curve: Curves.decelerate)),
        fadeAnimationThird = CurvedAnimation(
            parent: controller,
            curve: Interval(0.60, 0.80, curve: Curves.decelerate)),
        fadeAnimationFourth = CurvedAnimation(
            parent: controller,
            curve: Interval(0.70, 1.0, curve: Curves.decelerate)),
        super(key: key) {
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
      begin: 0.5,
      end: 0.8,
      curve: Curves.easeInQuad,
      children: <Widget>[
        Container(
          height: growAnimation.value,
          child: RoundedIconButton(
            iconData: FontAwesomeIcons.chartBar,
            onPressed: () => ModalUtils.showModal(
                context, ChartsModule(CountryCasesGraphWidget())),
          ),
        ),
        
        InfoTileWidget(
          padding: const EdgeInsets.only(top:20.0),
          number: "${info.cases}",
          title: "Número de Casos",
          todayNum: "${info.todayCases}",
        ),
        
        InfoTileWidget(
          padding: const EdgeInsets.only(top:20.0),
          number: "${info.deaths}",
          title: "Número de Mortes",
          todayNum: "${info.todayDeaths}",
        ),
        
        InfoTileWidget(
          padding: const EdgeInsets.only(top:20.0),
          number: "${info.critical}",
          title: "Pacientes em estado grave",
        ),
        
        InfoTileWidget(
          padding: const EdgeInsets.only(top:20.0),
          number: "${info.recovered}",
          title: "Pacientes recuperados",
        ),
      ],
    );
  }
}




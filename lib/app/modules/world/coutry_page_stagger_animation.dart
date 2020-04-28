import 'package:corona_data/app/modules/charts/charts_module.dart';
import 'package:corona_data/app/modules/charts/widgets/country_cases/country_cases_widget.dart';
import 'package:corona_data/app/modules/charts/widgets/world_cases/world_cases_widget.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/utils/modal_utils.dart';
import 'package:corona_data/app/shared/widgets/animations/faded_list_view.dart';
import 'package:corona_data/app/shared/widgets/info_tile_widget.dart';
import 'package:corona_data/app/shared/widgets/roudend_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorldPageStaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final InfoModel info;
  final Animation<double> growAnimation;


  WorldPageStaggerAnimation({Key key, this.controller, this.info})
      : growAnimation = Tween<double>(begin: 0.0, end: 50.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.4, 0.7, curve: Curves.decelerate))),
        
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
      begin: 0.4,
      end: 0.8,
      curve: Curves.easeInQuad,
      children: <Widget>[
        Container(
          height: growAnimation.value,
          child: RoundedIconButton(
            iconData: FontAwesomeIcons.chartBar,
            onPressed: () => ModalUtils.showModal(
                context, ChartsModule(WorldCasesGraphWidget())),
          ),
        ),
        
        InfoTileWidget(
              padding: const EdgeInsets.only(top:20.0),
              number: "${info.cases}",
              todayNum: "${info.todayCases}",
              title: "Número de Casos",
            ),
            
            InfoTileWidget(
              padding: const EdgeInsets.only(top:20.0),
              number: "${info.deaths}",
              todayNum: "${info.todayDeaths}",
              title: "Número de Mortes",
            ),
            
            InfoTileWidget(
              padding: const EdgeInsets.only(top:20.0),
              number: "${info.affectedCountries}",
              title: "Número de países afetados",
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




// ListView(
//           children: <Widget>[
//             RoundedIconButton(
//               iconData: FontAwesomeIcons.chartBar,
//               onPressed: () =>
//                   ModalUtils.showModal(context, ChartsModule(WorldCasesGraphWidget())),
//             ),
//             Container(height: 10,),
//             InfoTileWidget(
//               number: "${info.cases}",
//               todayNum: "${info.todayCases}",
//               title: "Número de Casos",
//             ),
//             Container(
//               height: 20,
//             ),
//             InfoTileWidget(
//               number: "${info.deaths}",
//               todayNum: "${info.todayDeaths}",
//               title: "Número de Mortes",
//             ),
//             Container(
//               height: 20,
//             ),
//             InfoTileWidget(
//               number: "${info.affectedCountries}",
//               title: "Número de países afetados",
//             ),
//             Container(
//               height: 20,
//             ),
//             InfoTileWidget(
//               number: "${info.critical}",
//               title: "Pacientes em estado grave",
//             ),
//             Container(
//               height: 20,
//             ),
//             InfoTileWidget(
//               number: "${info.recovered}",
//               title: "Pacientes recuperados",
//             ),
//           ],
//         );
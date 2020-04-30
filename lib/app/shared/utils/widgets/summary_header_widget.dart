import 'package:corona_data/app/modules/charts/charts_module.dart';
import 'package:corona_data/app/modules/charts/widgets/country_cases/country_cases_widget.dart';
import 'package:corona_data/app/shared/models/info_model.dart';
import 'package:corona_data/app/shared/widgets/roudend_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modal_utils.dart';

class SummaryHeaderWidget extends StatelessWidget {
  SummaryHeaderWidget({
    Key key,
    @required this.info,
    @required this.iconName,
    @required this.controller,
  })  : growAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.3, 0.7, curve: Curves.decelerate))),
        containerAnimation =
            Tween<double>(begin: 0.7, end: 0.85).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.5, 1.0, curve: Curves.elasticOut),
        )),
        super(key: key);

  final InfoModel info;
  final Animation<double> growAnimation;
  final Animation<double> containerAnimation;
  final String iconName;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.topCenter,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * containerAnimation.value,
            height: 125,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/flags/${this.iconName}.svg",
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                  height: growAnimation.value * (94.0),
                ),
                SizedBox(
                  width: 25,
                ),
                Opacity(
                  opacity: growAnimation.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text("Número de Casos",
                          style: GoogleFonts.robotoSlab(
                              fontSize: 15,
                              letterSpacing: -1,
                              color: Theme.of(context).primaryColorLight)),
                      Text(
                        "${info.cases}",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 36,
                            letterSpacing: -1.9,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.trending_up,
                            color: Color(0xffFF5656),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${info.todayCases}",
                            style: TextStyle(
                                color: Color(0xffFF5656), fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 110),
          height: growAnimation.value * 30,
          child: RoundedIconButton(
            iconData: FontAwesomeIcons.chartBar,
            onPressed: () => ModalUtils.showModal(
                context, ChartsModule(CountryCasesGraphWidget())),
          ),
        ),
      ],
    );
  }
}

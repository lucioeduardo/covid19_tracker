import 'package:flutter/material.dart';
import 'package:projeto_pp/app/models/info_model.dart';
import 'package:projeto_pp/app/shared/widgets/country_summary_widget.dart';
import 'package:projeto_pp/app/shared/widgets/highlighted_info_card.dart';
import 'package:projeto_pp/app/shared/widgets/title_subtitle_widget.dart';
import 'package:projeto_pp/app/shared/widgets/titled_value_widget.dart';

class CountryPage extends StatefulWidget {
  final String title;
  final InfoModel countryInfo;
  const CountryPage({Key key, this.title = 'CountryPage', this.countryInfo}) : super(key: key);
  @override
  CountryPageState createState() => CountryPageState();
}
class CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                TitleSubtitleWidget(title: widget.countryInfo.country),
                SizedBox(height: 20,),
                CountrySummaryWidget(
                  info: widget.countryInfo,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HighlightedInfoCard(
                      title: 'Mortes',
                      value: widget.countryInfo.deaths,
                      todayValue: widget.countryInfo.todayDeaths,
                      backgroundColor: Color(0xff581A12),
                    ),
                    HighlightedInfoCard(
                      title: 'Recuperados',
                      value: widget.countryInfo.recovered,
                      todayValue: widget.countryInfo.todayRecovered,
                      backgroundColor: Color(0xff194A2A),
                      todayInfoColor: Color(0xff6EFF56),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            color: Theme.of(context).secondaryHeaderColor,
            width: MediaQuery.of(context).size.width,
            height: 332,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TitledValueWidget(title: 'População total', value: widget.countryInfo.population),
                  TitledValueWidget(title: 'Testes realizados', value: widget.countryInfo.tests),
                  TitledValueWidget(title: 'Pacientes em estado crítico', value: widget.countryInfo.critical),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
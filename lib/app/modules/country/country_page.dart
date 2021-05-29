import 'package:flutter/material.dart';
import 'package:projeto_pp/app/models/info_model.dart';
import 'package:projeto_pp/app/shared/widgets/country_summary_widget.dart';
import 'package:projeto_pp/app/shared/widgets/title_subtitle_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
            TitleSubtitleWidget(title: widget.countryInfo.country),
            SizedBox(height: 20,),
            CountrySummaryWidget(
              info: widget.countryInfo,
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projeto_pp/app/shared/widgets/titled_value_widget.dart';
import 'package:projeto_pp/app/shared/widgets/today_info_widget.dart';

class HighlightedInfoCard extends StatelessWidget {
  final String title;
  final num value;
  final num todayValue;
  final Color backgroundColor;
  final Color todayInfoColor;

  HighlightedInfoCard(
      {Key key,
      this.title,
      this.value,
      this.backgroundColor,
      this.todayInfoColor,
      this.todayValue})
      : super(key: key);

  final NumberFormat f = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 190,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: GoogleFonts.robotoSlab(
                    fontSize: 16,
                    letterSpacing: -1.4,
                    color: Theme.of(context).primaryColorLight),
              ),
              TodayInfoWidget(
                text: "${f.format(todayValue)}",
                color: todayInfoColor,
              ),
            ],
          ),
          SizedBox(height: 5,),
          Text(
            "${f.format(value)}",
            style: GoogleFonts.robotoSlab(
                fontSize: 32,
                letterSpacing: -1.6,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

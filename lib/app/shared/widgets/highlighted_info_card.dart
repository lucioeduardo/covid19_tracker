import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projeto_pp/app/shared/widgets/today_info_widget.dart';

class HighlightedInfoCard extends StatelessWidget {
  final String title;
  final num value;
  final num todayValue;
  final Color backgroundColor;
  final Color todayInfoColor;
  

  HighlightedInfoCard({Key key, this.title, this.value, this.backgroundColor, this.todayInfoColor, this.todayValue})
      : super(key: key);

  final f = NumberFormat.compact();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:10, horizontal: 10),
      width: 190,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: GoogleFonts.robotoSlab(
                    fontSize: 18,
                    letterSpacing: -1.6,
                    color: Theme.of(context).primaryColorLight),
              ),
              SizedBox(height: 5,),
              Text("${f.format(value)}",
                  style: GoogleFonts.robotoSlab(
                      fontSize: 32,
                      letterSpacing: -1.9,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          TodayInfoWidget(text: "${f.format(todayValue)}", color: todayInfoColor,),
        ],
      ),
    );
  }
}

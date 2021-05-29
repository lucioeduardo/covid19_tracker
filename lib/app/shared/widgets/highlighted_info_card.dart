import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projeto_pp/app/shared/widgets/today_info_widget.dart';

import '../../shared/extensions/text_size_extension.dart';


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
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: 190.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
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
                    fontSize: 16.sp,
                    letterSpacing: -1.4.sp,
                    color: Theme.of(context).primaryColorLight),
              ),
              TodayInfoWidget(
                text: "${f.format(todayValue)}",
                color: todayInfoColor,
              ),
            ],
          ),
          SizedBox(height: 5.h,),
          Text(
            "${f.format(value)}",
            style: GoogleFonts.robotoSlab(
                fontSize: 32.sp,
                letterSpacing: -1.6.sp,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

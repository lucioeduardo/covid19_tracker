import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projeto_pp/app/shared/widgets/today_info_widget.dart';
import '../../models/info_model.dart';

import '../../shared/extensions/text_size_extension.dart';


class CountrySummaryWidget extends StatelessWidget {
  CountrySummaryWidget({
    Key key,
    @required this.info,
  });

  final InfoModel info;
  final NumberFormat f = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 125.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.all(Radius.circular(10.w))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100.w,
              child: Hero(
                tag: info.flagPath,
                child: Image.network(info.flagPath),
              ),
            ),
            SizedBox(
              width: 40.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 5.h,
                ),
                Text('Número de Casos',
                    style: GoogleFonts.robotoSlab(
                        fontSize: 15.sp,
                        letterSpacing: -1.sp,
                        color: Theme.of(context).primaryColorLight)),
                Text(
                  "${f.format(info.cases)}",
                  style: GoogleFonts.robotoSlab(
                      fontSize: 36.sp,
                      letterSpacing: -1.9.sp,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                ),
                TodayInfoWidget(text: "${f.format(info.todayCases)}")
              ],
            )
          ],
        ),
      ),
    );
  }
}



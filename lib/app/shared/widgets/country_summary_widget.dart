import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../models/info_model.dart';

class CountrySummaryWidget extends StatelessWidget {
  CountrySummaryWidget({
    Key key,
    @required this.info,
  });

  final InfoModel info;
  final f = NumberFormat.compact();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              child: Hero(
                tag: info.flagPath,
                child: Image.network(info.flagPath),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text('Número de Casos',
                    style: GoogleFonts.robotoSlab(
                        fontSize: 15,
                        letterSpacing: -1,
                        color: Theme.of(context).primaryColorLight)),
                Text(
                  "${f.format(info.cases)}",
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
                      "${f.format(info.todayCases)}",
                      style: TextStyle(color: Color(0xffFF5656), fontSize: 18),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

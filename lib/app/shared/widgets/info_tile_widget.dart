import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoTileWidget extends StatelessWidget {
  final String title, number, todayNum;
  final EdgeInsets padding;

  const InfoTileWidget(
      {Key key,
      @required this.title,
      @required this.number,
      this.todayNum, this.padding=const EdgeInsets.only(top: 10),
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$title",
                  style: GoogleFonts.robotoSlab(
                      fontSize: 18,
                      letterSpacing: -1.6,
                      color: Theme.of(context).primaryColorLight),
                ),
                Container(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text("$number",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 36,
                            letterSpacing: -1.9,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold)),
                    todayNum == null
                        ? Container()
                        : Text(
                            "(+$todayNum)",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 22,
                                color: Color(0xffFF5656)),
                          )
                  ],
                )
              ],
            ),          
          ],
        ),
      ),
    );
  }
}

import 'package:corona_data/app/shared/widgets/percentage_badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoTileWidget extends StatelessWidget {
  final String title, number, todayNum;
  final EdgeInsets padding;
  final PercentageBadgeWidget percentageBadge;

  const InfoTileWidget({
    Key key,
    @required this.title,
    @required this.number,
    this.todayNum,
    this.padding = const EdgeInsets.only(top: 10), 
    this.percentageBadge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                                  color: Theme.of(context).errorColor ??
                                      (0xffFF5656)),
                            )
                    ],
                  )
                ],
              ),
            ),
            this.percentageBadge ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}



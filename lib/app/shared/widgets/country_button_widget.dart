import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projeto_pp/app/models/info_model.dart';
import 'package:projeto_pp/app/shared/widgets/click_animation.dart';

class CountryButtonWidget extends StatelessWidget {
  CountryButtonWidget(
      {Key key,
      @required this.info,
      @required this.title,
      @required this.buttonOnPressed});

  final InfoModel info;
  final String title;
  final VoidCallback buttonOnPressed;

  final f = NumberFormat.compact();

  @override
  Widget build(BuildContext context) {
    return ClickAnimation(
      borderRadius: BorderRadius.circular(10.0),
      onTap: buttonOnPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,
              //height: 150,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        child: Text(
                          info.country,
                          style: GoogleFonts.robotoSlab(
                              fontSize: 22,
                              letterSpacing: -1.9,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Casos',
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 15,
                                    letterSpacing: -1,
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              Text(
                                f.format(info.cases),
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 18,
                                    letterSpacing: -1.5,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mortes',
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 15,
                                    letterSpacing: -1,
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              Text(
                                f.format(info.deaths),
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 18,
                                    letterSpacing: -1.5,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projeto_pp/app/models/info_model.dart';
import 'package:projeto_pp/app/shared/widgets/click_animation.dart';

import '../../shared/extensions/text_size_extension.dart';


class CountryButtonWidget extends StatelessWidget {
  CountryButtonWidget(
      {Key key,
      @required this.info,
      @required this.title,
      @required this.buttonOnPressed});

  final InfoModel info;
  final String title;
  final VoidCallback buttonOnPressed;

  final NumberFormat f = Modular.get();

  @override
  Widget build(BuildContext context) {
    return ClickAnimation(
      borderRadius: BorderRadius.circular(10.0.w),
      onTap: buttonOnPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,
              //height: 150,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
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
                    width: 50.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150.w,
                        child: Text(
                          info.country,
                          style: GoogleFonts.robotoSlab(
                              fontSize: 22.sp,
                              letterSpacing: -1.9.sp,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Casos',
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 15.sp,
                                    letterSpacing: -1.sp,
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              Text(
                                f.format(info.cases),
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 18.sp,
                                    letterSpacing: -1.5.sp,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mortes',
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 15.sp,
                                    letterSpacing: -1.sp,
                                    color: Theme.of(context).primaryColorLight),
                              ),
                              Text(
                                f.format(info.deaths),
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 18.sp,
                                    letterSpacing: -1.5.sp,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
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

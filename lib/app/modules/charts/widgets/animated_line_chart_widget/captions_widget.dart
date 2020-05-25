import 'package:flutter/material.dart';

import 'caption_widget.dart';
import '../../i18n/charts_page.i18n.dart';


class CaptionsWidget extends StatelessWidget {
  const CaptionsWidget({
    Key key,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Theme.of(context).accentColor.withAlpha(50),
      ),
      child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 1000),
          tween: Tween<double>(
            begin: screenWidth * 0.5,
            end: screenWidth * 0.8,
          ),
          curve: Curves.elasticOut,
          builder: (_, width, __) {
            return Container(
              width: width,
              child: Column(
                children: <Widget>[
                  CaptionWidget(
                      color: Colors.red,
                      label: "Total cases".i18n),
                  CaptionWidget(
                      color: Colors.black,
                      label: "Number of deaths".i18n),
                  CaptionWidget(
                      color: Colors.green,
                      label: "Recovered patients".i18n),
                ],
              ),
            );
          }),
    );
  }
}
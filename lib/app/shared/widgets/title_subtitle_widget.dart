import 'package:flutter/material.dart';
import 'package:projeto_pp/app/shared/util/theme/color_palette.dart';

class TitleSubtitleWidget extends StatelessWidget {
  const TitleSubtitleWidget({
    Key key,
    @required this.title,
    this.subtitle,
    this.alignment,
    this.subtitleStyle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final TextStyle subtitleStyle;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment??Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 40,
              letterSpacing: -1.9,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          subtitle != null
              ? Text(
                  subtitle,
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.7,
                      height: 1),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

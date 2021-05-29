import 'package:flutter/material.dart';

class TodayInfoWidget extends StatelessWidget {
  const TodayInfoWidget({
    Key key,
    @required this.text, this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.trending_up,
          size: 18,
          color: color ?? Color(0xffFF5656),
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          text,
          style: TextStyle(color: color ?? Color(0xffFF5656), fontSize: 18),
        ),
      ],
    );
  }
}
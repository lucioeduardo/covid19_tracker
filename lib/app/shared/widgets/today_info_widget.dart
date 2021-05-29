import 'package:flutter/material.dart';
import '../../shared/extensions/text_size_extension.dart';


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
          size: 18.sp,
          color: color ?? Color(0xffFF5656),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          text,
          style: TextStyle(color: color ?? Color(0xffFF5656), fontSize: 18.sp),
        ),
      ],
    );
  }
}
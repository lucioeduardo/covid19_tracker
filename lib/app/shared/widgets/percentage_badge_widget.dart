import 'package:flutter/material.dart';

class PercentageBadgeWidget extends StatelessWidget {
  PercentageBadgeWidget({
    Key key,
    @required this.color,
    @required this.percentage,
  }) : super(key: key);

  final Color color;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 43,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
      ),
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 10),
        child: Text(
          "${(percentage * 100).toStringAsFixed(2)}%",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

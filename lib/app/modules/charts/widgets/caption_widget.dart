import 'package:flutter/material.dart';

class CaptionWidget extends StatelessWidget {
  final Color color;
  final String label;

  const CaptionWidget({Key key, @required this.color, @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Container(
            width: 10,
            height: 10,
            color: color,
            margin: EdgeInsets.only(right: 10),
          ),
          Expanded(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }
}

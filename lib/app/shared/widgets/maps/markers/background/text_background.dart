import 'package:flutter/material.dart';

class TextBackgroundMarker extends StatelessWidget {
  const TextBackgroundMarker({
    Key key,
    @required this.shortTitle,
  }) : super(key: key);

  final String shortTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.shortTitle,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
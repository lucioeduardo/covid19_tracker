import 'package:flutter/material.dart';

class CustomDividerError extends StatelessWidget {
  final String message;

  const CustomDividerError(this.message);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          color: Colors.redAccent,
        ),
        Text(
          message,
          style: TextStyle(color: Colors.redAccent),
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgBackgroundMarker extends StatelessWidget {
  final double height;
  final String imagePath;

  const SvgBackgroundMarker({Key key, this.height, this.imagePath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      this.imagePath,
      placeholderBuilder: (context) => CircularProgressIndicator(),
      height: this.height,
    );
  }
}
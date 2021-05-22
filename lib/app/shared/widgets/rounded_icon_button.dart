import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final String title;

  const RoundedIconButton(
      {Key key, @required this.onPressed, this.iconData, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      //margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: Theme.of(context).buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              iconData,
              size: 24,
              color: Theme.of(context).primaryColorDark,
            ),
            Container(
              width: 5,
            ),
            Text(
              this.title,
              style: GoogleFonts.robotoSlab(
                fontSize: 16,
                color: Theme.of(context).primaryColorDark,
                letterSpacing: -1.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

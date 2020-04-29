import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const RoundedIconButton({Key key, @required this.onPressed, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          padding: EdgeInsets.all(10),
          onPressed: onPressed,
          color: Theme.of(context).buttonColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                iconData,
                size: 30,
                color: Theme.of(context).primaryColorDark,
              ),
              Container(
                width: 10,
              ),
              Text(
                "Gráfico",
                style: GoogleFonts.robotoSlab(
                    fontSize: 20, color: Theme.of(context).primaryColorDark),
              ),
            ],
          )),
    );
  }
}

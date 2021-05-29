import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TitledValueWidget extends StatelessWidget {
  TitledValueWidget({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  final String title;
  final NumberFormat f = NumberFormat.compact(locale: 'pt-br');
  final num value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: GoogleFonts.robotoSlab(
              fontSize: 18,
              letterSpacing: -1.4,
              color: Theme.of(context).primaryColorLight),
        ),
        SizedBox(height: 5,),
        Text("${f.format(value)}",
            style: GoogleFonts.robotoSlab(
                fontSize: 32,
                letterSpacing: -1.6,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
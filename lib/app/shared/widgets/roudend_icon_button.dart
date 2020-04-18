import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const RoundedIconButton({Key key, this.onPressed, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          //color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        width: 45,
        height: 45,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Theme.of(context).accentColor,
          child: InkWell(
            onTap: onPressed,
            child: Icon(
              iconData,
              size: 30,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ));
  }
}

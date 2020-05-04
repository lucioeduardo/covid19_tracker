import 'package:corona_data/app/shared/utils/string/string_utils.dart';
import 'package:corona_data/app/shared/utils/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../translations/settings_page.i18n.dart';

class ThemeDropdown extends StatelessWidget {
  final String value;
  final void Function(String newValue) onChanged;

  const ThemeDropdown({Key key, this.value, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        value: value,
        iconEnabledColor: Theme.of(context).primaryColor,
        focusColor: Theme.of(context).primaryColor,
        icon: Icon(
          Icons.arrow_downward,
          color: Theme.of(context).accentColor,
        ),
        iconSize: 15,
        elevation: 16,
        style: GoogleFonts.robotoSlab(
            color: Theme.of(context).accentColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
        underline: Container(
          height: 1,
          color: Theme.of(context).accentColor,
        ),
        selectedItemBuilder: (BuildContext context) {
          return ThemeUtils.getThemeNamesPretty().map<Widget>((String item) {
            return Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: Text(capitalize(item).i18n),
            );
          }).toList();
        },
        onChanged: onChanged,
        items: ThemeUtils.getThemeNamesPretty()
            .toList()
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              capitalize(value).i18n,
            ),
          );
        }).toList(),
      ),
    );
  }
}

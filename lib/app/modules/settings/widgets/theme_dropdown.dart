import 'package:corona_data/app/shared/utils/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDropdown extends StatelessWidget {

  final String value;
  final void Function(String newValue) onChanged;

  const ThemeDropdown({Key key, this.value, this.onChanged}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(child:
      DropdownButton<String>(
                      value: value,
                      iconEnabledColor: Theme.of(context).primaryColor,
                      focusColor: Theme.of(context).primaryColor,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Theme.of(context).accentColor,
                      ),
                      iconSize: 15,
                      elevation: 16,
                      style:  GoogleFonts.robotoSlab(
                      color: Theme.of(context).accentColor, fontSize: 16, fontWeight: FontWeight.w600),
                      underline: Container(
                        height: 1,
                        color: Theme.of(context).accentColor,
                      ),
                      onChanged: onChanged,
                      items: ThemeUtils.getThemeNamesPretty()
                          .toList()
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            
                          ),
                        );
                      }).toList(),
                    ),
    );
  }
}
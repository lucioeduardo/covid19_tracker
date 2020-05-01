import 'package:corona_data/app/shared/config/config.dart';
import 'package:corona_data/app/shared/utils/localization/localization_interface.dart';
import 'package:corona_data/app/shared/utils/localization/localization_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LocaleDropDown extends StatelessWidget {
  final String value;
  final String countryCode;
  final void Function(String newValue) onChanged;

  const LocaleDropDown({Key key, this.value, this.onChanged, this.countryCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      
      child: DropdownButton<String>(
        value: value,
        iconEnabledColor: Theme.of(context).primaryColor,
        focusColor: Theme.of(context).primaryColor,
        icon: null,
        iconSize: 15,
        elevation: 16,
        style: GoogleFonts.robotoSlab(
            color: Theme.of(context).accentColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
        underline: Container(
          height: 0,
          color: Theme.of(context).accentColor,
        ),
        onChanged: onChanged,
        selectedItemBuilder: _selectedItemBuilder,
        items: _dropdownMenuItem(),
      ),
    );
  }

  List<Widget> _selectedItemBuilder(context) {
        return LocalizationUtils.getLocaleNamesPretty()
            .map(
              (locale) => Container(
                alignment: Alignment.centerLeft,
                height: 35,
                width: 35,
                child: SvgPicture.asset(
                  "assets/flags/$countryCode.svg",
                ),
              ),
            )
            .toList();
      }

  List<DropdownMenuItem<String>> _dropdownMenuItem(){
    return Configuration.locales.keys.map<DropdownMenuItem<String>>((String key) {
          ILocalization localeTemp = LocalizationUtils.getLocale(key);
          return DropdownMenuItem<String>(
            value: key.toUpperCase(),
            child: Container(
              padding: EdgeInsets.only(top:5),
              height: 40,
              width: 40,
              child: SvgPicture.asset(
                      "assets/flags/${localeTemp.countryCode.toLowerCase()}.svg",
                    ),
            ),
          );
        }).toList();

  }
}
